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
            Spacer()
            
            Text(exercise.name)
                .font(.footnote)
                .bold()
            
            Text(exercise.desc)
                .font(.caption2)
            
            Spacer()
            
            // Image
        }
        .frame(width: 188, height: 290)
        .cornerRadius(10)
        .border(.black, width: 4) // hanya untuk liat cardnya
    }
}

struct ExerciseCard_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCard(exercise: ExerciseModel(id: 1, name: "3 Minute Breathing", duration: "3 Minutes", desc: "Napas dulu coyy 3 menit aje"))
    }
}
