//
//  ExerciseCard.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import SwiftUI

struct ExerciseCard: View {
    var exercise: ExerciseModel
    
    var body: some View {
        VStack (alignment: .center){
//            Text(exercise.name)
//                .font(.title3)
//                .bold()
//
//            Text(exercise.desc)
//                .font(.caption2)
//
//            Spacer()
        }
        .foregroundColor(.black)
        .padding()
        .frame(width: 189, height: 292)
        .background(
            Image(exercise.backgroundURL)
                .resizable()
                .scaledToFit()
        )
        .cornerRadius(10)
    }
}

struct ExerciseCard_Previews: PreviewProvider {
    static var previews: some View {

        ExerciseCard(exercise: ExerciseModel(id: 1, name: "3 Minute Breathing", duration: "3 Minutes", desc: "Napas dulu coyy 3 menit aje", requirement: ["butuh a", "butuh b", "butuh c"], icon: "icon3MB", backgroundURL: "Cards/3MB", bg: "bg3MB" ))
    }
}
