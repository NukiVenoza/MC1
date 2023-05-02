//
//  ContentView.swift
//  MC1
//
//  Created by Nuki Venoza on 19/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userVM = UserViewModel()
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
                    .environmentObject(router)

                MePage()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Me")
                    }
            }
            .navigationTitle("Focus")
        }
        .navigationDestination(for: ExerciseModel.self) { ex in
            ExerciseDetailView(exercise: ex)
                .environmentObject(router)
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
