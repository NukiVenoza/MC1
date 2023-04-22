//
//  ExerciseRequiremenrView.swift
//  MC1
//
//  Created by Devin Maleke on 21/04/23.
//

import SwiftUI

struct ExerciseRequirementView: View {
    var exercise: ExerciseModel
    var icon: UIImage
    
    var body: some View {
        VStack(alignment: .center){
            Image(uiImage: icon)
            Text(exercise.name + " Preparation")
                .bold()
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding()
            ForEach(exercise.requirement, id: \.self) { list in
                VStack{
                    HStack{
                        Text(list)
                        .padding()
                        Spacer()
                        .padding()
                    }
                        
                }
            }
            
            Text("Continue")
                .bold()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .background(Color(red: 0.066, green: 0.463, blue: 0.415))
                .cornerRadius(10)
            
            .padding()
        }
        
    }
}

struct ExerciseRequirementView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRequirementView(exercise: ExerciseModel(id: 1, name: "3 Minute Breathing", duration: "3 Minutes", desc: "Napas dulu coyy 3 menit aje",requirement: ["butuh a", "butuh b", "butuh c"]), icon: UIImage())
    }
}
