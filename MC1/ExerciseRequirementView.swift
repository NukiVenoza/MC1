//
//  ExerciseRequiremenrView.swift
//  MC1
//
//  Created by Devin Maleke on 21/04/23.
//

import SwiftUI

struct ExerciseRequirementView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var router: Router
    
    var exercise: ExerciseModel
    
    var body: some View {
        VStack{
            Image(exercise.icon)
                .resizable()
                .frame(width: 200, height: 200)
            Text(exercise.name + " Preparation")
                .bold()
                .fontWeight(.bold)
                .font(.system(size: 22))
                .padding(50)
            
            VStack(alignment: .leading){
            ForEach(exercise.requirement, id: \.self) { list in
                    HStack{
                        Label{
                            Text(list)
                                .fontWeight(.semibold)
                                .font(.system(size: 15))
                            

                        }icon: {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .foregroundColor(Color(red: 0.066, green: 0.463, blue: 0.415))
                            .frame(width: 33, height: 33)
    
                        }
                        
                            
                    }
                        
                }
                .padding()
            }
            
            NavigationLink(destination: ExercisePlayerView(exercise: exercise)
                .environmentObject(router)
                .environmentObject(userVM)) {
                Text("Continue")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(red: 0.066, green: 0.463, blue: 0.415))
                    .cornerRadius(10)

                
                    .padding(.bottom,20)
                    .padding(30)
            }
        }
        
    }
}


struct ExerciseRequirementView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRequirementView(exercise: ExerciseModel(id: 1, name: "3 Minutes Breath", duration: "3 Minutes", desc: "Using mindfulness of breathing for short periods at set times and when required. Best for dealing with mind wandering, and learning to be gentle with yourself.", requirement: ["Airpods or a conducive place", "A safe place for sit or lay down", "Turn on focus mode or do not disturb"], icon: "icon3MB", backgroundURL: "Cards/3MB", bg: "bg3MB"))
            .environmentObject(Router())
    }
}
