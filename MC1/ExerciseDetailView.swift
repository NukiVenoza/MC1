//
//  ExerciseDetailView.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import SwiftUI

struct ExerciseDetailView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var router: Router
    @State var showModal = false
    var exercise: ExerciseModel
//    var background: UIImage


    
    var body: some View {
        VStack (alignment: .leading){
            VStack{
                Image(exercise.bg)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
            }
            
            VStack(alignment: .leading){
                Text(exercise.name)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.bottom,15)
                    
                
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
                .padding(.bottom,15)
                
                
                Text(exercise.desc)
                    .fontWeight(.regular)
                    .frame(width: 326, height: 72)
                    .font(.system(size: 15))
                    
                    
                
            }
            .padding(.leading,20)
                .padding()
                
            
//            NavigationLink(destination: ExerciseRequirementView(exercise: exercise)
//                .environmentObject(router)
//                .environmentObject(userVM)) {
                Text("Start")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(red: 0.066, green: 0.463, blue: 0.415))
                    .cornerRadius(10)
//            }
            .padding(.bottom,20)
            .padding(30)
            .onTapGesture {
                showModal.toggle()
            }
            .fullScreenCover(isPresented: $showModal, content:{
                ExerciseRequirementView(exercise: exercise)
            })
            
        }
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(exercise: ExerciseModel(id: 1, name: "3 Minutes Breath", duration: "3 Minutes", desc: "Using mindfulness of breathing for short periods at set times and when required. Best for dealing with mind wandering, and learning to be gentle with yourself.", requirement: ["Airpods or a conducive place", "A safe place for sit or lay down", "Turn on focus mode or do not disturb"], icon: "icon3MB", backgroundURL: "Cards/3MB", bg: "bg3MB", audioDuration: 207, audioName: "3MB Audio"))
            .environmentObject(Router())
    }
}
