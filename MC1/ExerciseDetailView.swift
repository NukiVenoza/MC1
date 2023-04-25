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
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding()
                
                HStack {
                    Image(systemName: "timer")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color(red: 0.066, green: 0.463, blue: 0.415))
                    
                    Text(exercise.duration)
                        .fontWeight(.regular)
                        .font(.system(size: 17))
                        .foregroundColor(Color(red: 0.3333333333333333, green: 0.3333333333333333, blue: 0.3333333333333333))
                        
                }
                .padding()
                
                Text(exercise.desc)
                    .fontWeight(.regular)
                    .frame(width: 326, height: 72)
                    .font(.system(size: 15))
                    .padding()
                
                
//                NavigationLink(destination: ExerciseRequirementView()){
                Text("Start")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
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
        ExerciseDetailView(exercise: ExerciseModel(id: 1, name: "3 Minutes Breath", duration: "3 Minutes", desc: "Using mindfulness of breathing for short periods at set times and when required. Best for dealing with mind wandering, and learning to be gentle with yourself.", requirement: ["Airpods or a conducive place", "A safe place for sit or lay down", "Turn on focus mode or do not disturb"], icon: "icon3MB"))
    }
}
