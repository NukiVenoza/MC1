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
    
    var body: some View {
//        EndlessHorizontalScrollingView()
        NavigationStack(path: $router.path) {
            TabView {
                ExercisePage()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Exercise")
                    }
                    .environmentObject(userVM)
                    .environmentObject(exerciseVM)
                    .environmentObject(router)

                MePage()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Me")
                    }
            }
            .navigationTitle("Focus")
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
                }
            }
            .navigationDestination(for: ExerciseModel.self) { ex in
                ExerciseDetailView(exercise: ex)
                    .environmentObject(userVM)
                    .environmentObject(exerciseVM)
                    .environmentObject(router)
            }
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
