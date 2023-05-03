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
    @EnvironmentObject var exerciseVM: ExerciseViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var showModal2 = false
    
    var body: some View {
        let exercise = exerciseVM.getCurrentExercise()
        
        VStack{
            HStack{
                Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("Close")
                        .foregroundColor(Color(red: 0.066, green: 0.463, blue: 0.415))
                    
                }
                .padding(.leading,20)
                Spacer()
            }
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
                .onTapGesture {
                    showModal2.toggle()
                }
                .fullScreenCover(isPresented: $showModal2, content: {
                        ExercisePlayerView()
                            .environmentObject(router)
                            .environmentObject(exerciseVM)
                    }
                )
            
            Spacer()
        }
    }
}


struct ExerciseRequirementView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRequirementView()
            .environmentObject(Router())
            .environmentObject(ExerciseViewModel())
    }
}
