//
//  ContentView.swift
//  MC1
//
//  Created by Nuki Venoza on 19/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userVM = UserViewModel()
    @StateObject var exerciseVM = ExerciseViewModel()
    @StateObject var router = Router()
    
    @State var selection = 1
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 26/255, green: 97/255, blue: 88/255, alpha: 1)
        
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.white)
    }
    
    var body: some View {
//        EndlessHorizontalScrollingView()
        
        NavigationStack(path: $router.path) {
            TabView(selection: $selection) {
                ExercisePage()
                    .tabItem {
                        VStack{
                            Image(selection == 1 ? "focus-active" : "focus-inactive")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                
                            Image(systemName: "person")
                            Text("Focus")
//                                .foregroundColor(Color.white)

                        }
                     
                        
                    }.tag(1)
                    .environmentObject(userVM)
                    .environmentObject(exerciseVM)
                    .environmentObject(router)

                MePage()
                    .tabItem {
                        Image(selection == 2 ? "me-active" : "me-inactive")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                        Text("Me")
                            .foregroundColor(Color.white)

                    }
                    .tag(2)
                    .environmentObject(userVM)
            }
            .accentColor(Color.white)
            .navigationTitle(selection == 1 ? "Focus" : "Me")
            .navigationDestination(for: String.self) { path in
                if path == "requirement" {
                    ExerciseRequirementView()
                        .environmentObject(router)
                        .environmentObject(exerciseVM)
                } else if path == "player" {
                    ExercisePlayerView()
                        .environmentObject(router)
                        .environmentObject(exerciseVM)
                } else if path == "done" {
                    CompletedView()
                        .environmentObject(router)
                        .environmentObject(userVM)
                }
            }
            .navigationDestination(for: ExerciseModel.self) { ex in
                ExerciseDetailView(exercise: ex)
                    .environmentObject(userVM)
                    .environmentObject(exerciseVM)
                    .environmentObject(router)
            }
        }
        .navigationBarBackButtonHidden()
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
