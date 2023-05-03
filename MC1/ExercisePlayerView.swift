//
//  ExercisePlayerView.swift
//  MC1
//
//  Created by Nuki Venoza on 28/04/23.
//

import SwiftUI

struct ExercisePlayerView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var router: Router
    @ObservedObject var audioPlayer = AudioPlayer()

    var exercise: ExerciseModel
    
    @State var firstRun = false
    @State var isPlaying = false
    @State var startAnimate = false
    @State var scaleAnimate = false
    @State var next = false
    
    @State var animationColor = Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100)
    @State var scaleEffect = 1.0
    @State var repeatAnimation = 200
    
//    @State private var progressBarOpacity = 0.0
    
    //sound progress bar
    @State private var progress: Double = 0.0
    @State private var currentTime: Double = 0.0
    @State private var totalTime: Double = 0.0
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button(action: {
                    // Attach the action to dismiss the view
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(Color(red: 116 / 255, green: 116 / 255, blue: 128 / 255, opacity: 0.2))
                }
            }
            .padding()
            .offset(y: -150)
            
            ZStack{
                Circle()
                    .scaleEffect(startAnimate ? 1.3 : 1.0)
                    .frame(maxWidth: 198, maxHeight: 198)
                    .animation(
                        .easeInOut(duration: 2.0).repeatCount(repeatAnimation), value: self.animationColor
                    )
                    .foregroundColor(animationColor)
                
                Circle()
                    .frame(maxWidth: 198, maxHeight: 198)
                    .foregroundColor(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100))
                
                
                Button(action: {
                    isPlaying.toggle()
                    startAnimate.toggle()
                    scaleAnimate.toggle()
                    firstRun = true
                    
                    if startAnimate {
//                        progressBarOpacity = 1.0
                        
                        repeatAnimation = 200
                        
                        animationColor = Color(red: 35 / 255, green: 171 / 255, blue: 155 / 255, opacity: 100)
                        
                        audioPlayer.play()
                    } else {
//                        progressBarOpacity = 0.0
                        
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
            
            VStack{
                Text(exercise.name)
                    .font(.system(size: 28))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100))
                    .padding(.bottom, 10)
                
                Text("Press Start to Begin")
                    .font(.system(size: 15))
                    .padding(.bottom, 10)
            }
            .padding(.top, 70)
            
            HStack {
                Text("\(formatTime(currentTime))")
                    .font(.system(size: 15))
            }
            .opacity(firstRun ?  1.0 : 0.0)
            
            VStack{
                ProgressView(value: progress, total: totalTime)
                    .scaleEffect(x: 1, y: 8, anchor: .center)
                    .offset(y: 120)
                    .tint(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100))
            }
            .opacity(firstRun ?  1.0 : 0.0)
            .onAppear {
                // Nanti diganti total duration dari sound yg dipake
                totalTime = exercise.audioDuration

            }
            .onReceive(Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()) { _ in

                if isPlaying {
                    currentTime += 0.01
                    progress = currentTime
                    
                    if currentTime >= totalTime {
                        
                        isPlaying = false
                        startAnimate = false
                        scaleAnimate = false
                        repeatAnimation = 0
                        animationColor = Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100)
                        audioPlayer.stop()
                        router.path.append("done")

                    }
                }
            }
        }
        .navigationDestination(for: String.self) { path in
            if path == "done" {
                CompletedView()
                    .environmentObject(router)
                    .environmentObject(userVM)

            }
        }
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
        ExercisePlayerView(exercise: ExerciseModel(id: 1, name: "3 Minutes Breath", duration: "3 Minutes", desc: "Using mindfulness of breathing for short periods at set times and when required. Best for dealing with mind wandering, and learning to be gentle with yourself.", requirement: ["Airpods or a conducive place", "A safe place for sit or lay down", "Turn on focus mode or do not disturb"], icon: "icon3MB", backgroundURL: "Cards/3MB", bg: "bg3MB", audioDuration: 207, audioName: "3MB Audio"))
            .environmentObject(Router())
    }
}

