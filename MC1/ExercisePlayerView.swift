//
//  ExercisePlayerView.swift
//  MC1
//
//  Created by Nuki Venoza on 28/04/23.
//

import SwiftUI

struct ExercisePlayerView: View {
    
    var exercise: ExerciseModel
    
    @State var animationColor = Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100)
    @State var scaleEffect = 1.0
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    Circle()
                        .scaleEffect(CGSize(width: scaleEffect, height: scaleEffect), anchor: .center)
                        .frame(maxWidth: 198, maxHeight: 198)
                        .animation(
                            .linear(duration: 1.0).repeatForever(), value: self.animationColor
                        )
                        .foregroundColor(animationColor)
                    
                    Circle()
                        .frame(maxWidth: 198, maxHeight: 198)
                        .foregroundColor(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100))
                    
//                    Image("playButton")
//                        .resizable()
//                        .frame(width: 81, height: 101)
//                        .padding(.leading, 10)
//
//                        .onTapGesture {
//                            animationColor = Color(red: 35 / 255, green: 171 / 255, blue: 155 / 255, opacity: 100)
//                            scaleEffect = 1.5
//                        }
                    
                    NavigationLink(destination: ExerciseRunView(exercise: exercise)){
                        Image("playButton")
                            .resizable()
                            .frame(width: 81, height: 101)
                            .padding(.leading, 10)
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
            }
            
            
        }
        
    }
}

struct ExercisePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisePlayerView(exercise: ExerciseModel(id: 1, name: "3 Minutes Breath", duration: "3 Minutes", desc: "Using mindfulness of breathing for short periods at set times and when required. Best for dealing with mind wandering, and learning to be gentle with yourself.", requirement: ["Airpods or a conducive place", "A safe place for sit or lay down", "Turn on focus mode or do not disturb"], icon: "icon3MB", backgroundURL: "Cards/3MB", bg: "bg3MB"))
    }
}
