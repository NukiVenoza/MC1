//
//  ExerciseDetailView.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import SwiftUI

struct ExerciseDetailView: View {
    
    var exercise: ExerciseModel
    
    var body: some View {
        VStack (alignment: .leading){
            // Image
            
            Text(exercise.name)
                .font(.title3)
            
            HStack {
                Image(systemName: "timer")
                
                Text(exercise.duration)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            
            Text(exercise.desc)
                .font(.body)
            
            Button {
                // go to exercise page
            } label: {
                Text("Start")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(exercise: ExerciseModel(id: 1, name: "3 Minute Breathing", duration: "3 Minutes", desc: "Napas dulu coyy 3 menit aje", backgroundURL: "Cards/3MB"))
    }
}
