//
//  ExercisePlayerView.swift
//  MC1
//
//  Created by Nuki Venoza on 28/04/23.
//

import SwiftUI

struct ExercisePlayerView: View {
    @State private var isActive = false
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var router: Router
    @EnvironmentObject var exerciseVM: ExerciseViewModel
    @EnvironmentObject var subtitleVM: SubtitleViewModel
    
    @ObservedObject var audioPlayer = AudioPlayer()
    @Environment(\.presentationMode) var presentationMode
    
    @State var firstRun = false
    @State var isPlaying = false
    @State var startAnimate = false
    @State var scaleAnimate = false
    @State var next = false
    
    @State var animationColor = Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100)
    @State var scaleEffect = 1.0
    @State var repeatAnimation = 200
    

    @State private var progress: Double = 0.0
    @State private var currentTime: Double = 0.0
    @State private var totalTime: Double = 0.0
    
    @State private var subtitleIdx = 0
    @State private var text = ""
    
    var body: some View {
        let exercise = exerciseVM.getCurrentExercise()
        
        ZStack {
            VStack {
                HStack(alignment: .top) {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(Color(red: 116 / 255, green: 116 / 255, blue: 128 / 255, opacity: 0.2))
                    }
                }
                .padding()
                
                Spacer()
            }
            
            ZStack{
                Circle()
                    .scaleEffect(startAnimate ? 1.3 : 1.0)
                    .frame(maxWidth: 198, maxHeight: 198)
                    .animation(
                        .linear(duration: 2.0).repeatCount(repeatAnimation), value: self.animationColor
                    )
                    .foregroundColor(animationColor)
                
                Circle()
                    .frame(maxWidth: 198, maxHeight: 198)
                    .foregroundColor(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100))
                
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isPlaying.toggle()
                    }
                    startAnimate.toggle()
                    scaleAnimate.toggle()
                    firstRun = true
                    
                    if startAnimate {

                        
                        repeatAnimation = 200
                        
                        animationColor = Color(red: 35 / 255, green: 171 / 255, blue: 155 / 255, opacity: 100)
                        
                        audioPlayer.play()
                    } else {

                        
                        animationColor = Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100)
                        
                        repeatAnimation = 0
                        
                        audioPlayer.pause()
                    }
                    
                }) {
                    Image(isPlaying ? "pauseButton" : "playButton")
                        .resizable()
                        .frame(width: 81, height: 101)
                        .padding(.leading, isPlaying ? 0 : 10)
                        
                }
            }
            .offset(y: -60)
            
            // text
            ZStack {
                if !isPlaying && currentTime == 0 {
                    Text("Press Start to Begin")
                        .font(.system(size: 15))
                } else {
                    Text(text)
                        .font(.system(size: 15))
                        .padding()
                        .multilineTextAlignment(.center)
                }
                
                VStack(spacing: 100) {
                    Text(exercise.name)
                        .font(.system(size: 28))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100))
                    
                    Text("\(formatTime(currentTime))")
                        .font(.system(size: 15))
                        .opacity(firstRun ?  1.0 : 0.0)
                }
            }
            .offset(y: 175)
            
            
            VStack {
                Spacer()
                ProgressView(value: progress, total: totalTime)
                    .scaleEffect(x: 1, y: 8, anchor: .center)
                    .tint(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100))
                    .padding(.bottom, 20)
            }
            .opacity(firstRun ?  1.0 : 0.0)
            .onAppear {
                
                totalTime = exercise.audioDuration

            }
            .onReceive(Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()) { _ in

                if isPlaying {
                    withAnimation {
                        currentTime += 1.0
                        progress = currentTime
                    }
                    
                    let subtitles = subtitleVM.getOffsets(exerciseId: exercise.id)
                    

                    if Int(currentTime) == Int(subtitles[subtitleIdx]) && subtitleIdx < subtitles.count - 1 {
                        
                        withAnimation {
                            text = subtitleVM.getSubtitles(exerciseId: exercise.id)[subtitleIdx].text
                        }
                        subtitleIdx += 1
                    }
                    
                    if currentTime >= totalTime {
                        isPlaying = false
                        startAnimate = false
                        scaleAnimate = false
                        repeatAnimation = 0
                        animationColor = Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100)
                        audioPlayer.stop()
                        isActive = true
                        
                        userVM.updateStreak()
                    }
                }
            }
            .background(
                NavigationLink(destination: CompletedView().environmentObject(router).environmentObject(userVM), isActive: $isActive) {
                    EmptyView()
                }
                
            )
        }
        .frame(maxHeight: .infinity)
        .navigationBarBackButtonHidden()
        .onAppear(){
            audioPlayer.firstPlay(audioName: exercise.audioName)
        }
    }
    
    func formatTime(_ time: Double) -> String {
        let minutes = Int(time / 60)
        let seconds = Int(time.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct ExercisePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisePlayerView()
            .environmentObject(Router())
            .environmentObject(ExerciseViewModel())
            .environmentObject(SubtitleViewModel())
    }
}

