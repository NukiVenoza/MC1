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
    
    @State var selection = 1
    
    var body: some View {
//        EndlessHorizontalScrollingView()
        NavigationStack(path: $router.path) {
            TabView(selection: $selection) {
                ExercisePage()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Exercise")
                    }.tag(1)
                    .environmentObject(userVM)
                    .environmentObject(router)

                MePage()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Me")
                    }
                    .tag(2)
                    .environmentObject(userVM)
            }
            .navigationTitle(selection == 1 ? "Focus" : "Me")
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
