//
//  ContentView.swift
//  MC1
//
//  Created by Nuki Venoza on 19/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userVM = UserViewModel()
    
    var body: some View {
        TabView {
            ExercisePage()
                .tabItem {
                    Image(systemName: "house")
                    Text("Exercise")
                }
                .environmentObject(userVM)
            
            MePage()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Me")
                }
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
