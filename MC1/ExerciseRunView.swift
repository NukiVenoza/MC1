//
//  ExerciseRunView.swift
//  MC1
//
//  Created by Nuki Venoza on 28/04/23.
//

import SwiftUI

struct ExerciseRunView: View {
    
    var exercise: ExerciseModel
    
    @State var animationColor = Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100)
    @State var scaleEffect = 1.0
    @State var repeatAnimation = 200
    
    //sound progress bar
    @State private var progress: Double = 0.0
    @State private var currentTime: Double = 0.0
    @State private var totalTime: Double = 0.0
    @State private var isPlaying: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    Circle()
                        .scaleEffect(CGSize(width: scaleEffect, height: scaleEffect), anchor: .center)
                        .frame(maxWidth: 198, maxHeight: 198)
                        .animation(
                            .linear(duration: 1.0).repeatCount(repeatAnimation), value: self.animationColor
                        )
                        .foregroundColor(animationColor)
                        .onAppear() {
                            animationColor = Color(red: 35 / 255, green: 171 / 255, blue: 155 / 255, opacity: 100)
                            scaleEffect = 1.5
                        }
                    
                    Circle()
                        .frame(maxWidth: 198, maxHeight: 198)
                        .foregroundColor(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100))
                    
                    Image("pauseButton")
                        .resizable()
                        .frame(width: 81, height: 101)
                        .onTapGesture {
                            animationColor = Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100)
                            scaleEffect = 1.0
                            
                            repeatAnimation = 0
                            isPlaying.toggle()
                        }
                }
                
                VStack{
                    Text(exercise.name)
                        .font(.system(size: 28))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100))
                    
                    Text("Press Start to Begin")
                        .font(.system(size: 15))
                }
                .padding(.top, 70)
                
                VStack{
                    ProgressView(value: progress, total: totalTime)
                        .scaleEffect(x: 1, y: 8, anchor: .center)
                        .offset(y: 120)
                        .tint(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100))

                }
                .onReceive(Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()) { _ in
                    if isPlaying {
                        currentTime += 1.0
                        progress = currentTime / totalTime
                        
                    }
                }
                .onAppear {
                    isPlaying.toggle()

                    // Nanti diganti total duration dari sound yg dipake
                    totalTime = 10.0
                }
                
                
            }
            
            
        }
        .navigationBarBackButtonHidden()

    }
}

struct ExerciseRunView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRunView(exercise: ExerciseModel(id: 1, name: "3 Minutes Breath", duration: "3 Minutes", desc: "Using mindfulness of breathing for short periods at set times and when required. Best for dealing with mind wandering, and learning to be gentle with yourself.", requirement: ["Airpods or a conducive place", "A safe place for sit or lay down", "Turn on focus mode or do not disturb"], icon: "icon3MB", backgroundURL: "Cards/3MB", bg: "bg3MB"))
    }
}
