//
//  ExercisePage.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import SwiftUI

struct ExercisePage: View {
    
    @StateObject var bannerVM = BannerViewModel()
    @StateObject var exerciseVM = ExerciseViewModel()
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 50){
                // Banner
                Text(bannerVM.getRandomQuotes())
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                
                Text("Choose Exercise")
                    .font(.title2)
                
                // 3 Card Carousel
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        
                        ForEach(exerciseVM.exercises) {ex in
                            NavigationLink(destination: ExerciseDetailView(exercise: ex)) {
                                ExerciseCard(exercise: ex)
                            }
                        }
                        
                    }
                }
                
            }
            .padding()
            
            .navigationTitle("Exercise")
        }
    }
}

struct ExercisePage_Previews: PreviewProvider {
    static var previews: some View {
        ExercisePage()
    }
}
