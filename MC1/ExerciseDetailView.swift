//
//  ExerciseDetailView.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import SwiftUI

struct ExerciseDetailView: View {
    
    var exercise: ExerciseModel
//    var background: UIImage


    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                // Image
                //            Image(uiImage: background)
                Text(exercise.name)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .padding()
                
                HStack {
                    Image(systemName: "timer")
                        .foregroundColor(Color(red: 0.066, green: 0.463, blue: 0.415))
                    
                    Text(exercise.duration)
                        .foregroundColor(.gray)
                        .font(.system(size: 20))
                }
                .padding()
                
                Text(exercise.desc)
                    .font(.body)
                    .padding()
                
                
//                NavigationLink(destination: ExerciseRequirementView()){
                    Text("Start")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 0.066, green: 0.463, blue: 0.415))
                        .cornerRadius(10)
//                }
                
                .padding()
            }
            .padding()
        }
    }
}


struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(exercise: ExerciseModel(id: 1, name: "3 Minute Breathing", duration: "3 Minutes", desc: "Napas dulu coyy 3 menit aje",requirement: ["butuh a", "butuh b", "butuh c"]))
    }
}
