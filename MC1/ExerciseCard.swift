//
//  ExerciseCard.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import SwiftUI

struct ExerciseCard: View {
    var exercise: ExerciseModel
    var background: UIImage
    
    var body: some View {
        VStack (alignment: .center){
            Text(exercise.name)
                .font(.title3)
                .bold()
            
            Text(exercise.desc)
                .font(.caption2)
            
            Spacer()
        }
        .foregroundColor(.black)
        .padding()
        .frame(width: 188, height: 290)
        .background(.yellow)
        .cornerRadius(10)
    }
}

struct ExerciseCard_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCard(exercise: ExerciseModel(id: 1, name: "3 Minute Breathing", duration: "3 Minutes", desc: "Napas dulu coyy 3 menit aje",requirement: ["butuh a", "butuh b", "butuh c"]), background: UIImage())
    }
}