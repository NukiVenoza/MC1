//
//  ExercisePage.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import SwiftUI

struct ExercisePage: View {
    @EnvironmentObject var userVM: UserViewModel
    
    @StateObject var bannerVM = BannerViewModel()
    @StateObject var exerciseVM = ExerciseViewModel()
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 50){
                VStack(alignment: .leading) {
                    Text("Welcome, \(userVM.user.name)")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    // Banner
                    HStack(alignment: .top, spacing: 16) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 5)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            let quote = bannerVM.getRandomQuotes()
                            Text("Message of the day ✨")
                                .font(.system(size: 14))
                            
                            Text(quote.text)
                                .multilineTextAlignment(.leading)
                            
                            Text("- \(quote.author)")
                                .font(.system(size: 14))
                            
                        }
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                        
                        Image(systemName: "arrow.clockwise")
                            .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .background(
                        Color(red: 17/255, green: 118/255, blue: 106/255)
                            .opacity(0.17)
                    )
                    .cornerRadius(10)
                }
                
                VStack(alignment: .leading) {
                    Text("Choose Focus Exercise")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    // 3 Card Carousel
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        LazyHStack {
//                            ForEach(exerciseVM.exercises) {ex in
//                                NavigationLink(destination: ExerciseDetailView(exercise: ex)) {
//                                    ExerciseCard(exercise: ex, background: UIImage())
//                                }
//                            }
//
//                        }
//                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        ScrollViewReader { value in
                            ZStack (alignment: .center) {
                                LazyHStack(alignment: .center, spacing:275) {
                                    ForEach (exerciseVM.exercises) { item in
                                        Rectangle()
                                            .frame(width: 1, height: 1, alignment: .center)
                                            .foregroundColor(.clear)
                                            .onAppear() {
//                                                print(item)
                                                withAnimation() {
                                                    value.scrollTo(item, anchor: .center)
                                                }
                                            }
                                    }
                                }

                                HStack(spacing:10) {
                                    ForEach(exerciseVM.exercises) { item in
                                        GeometryReader { geometry in
                                            ZStack {
                                                ExerciseCard(exercise: item, background: UIImage())
                                                    .rotation3DEffect(
                                                        Angle(degrees: Double(geometry.frame(in:.global).minX - 30) / -20),
                                                    axis: (x: 0.0, y: 10.0, z: 0.0))
                                            }
                                        }
                                        .frame(width: 275, height: 275)
                                }
                           }
                          .padding(30)
                          .padding(.bottom, 30)
                            }
                        }
                        
                    }
                    .offset(y: -30)
                }
            }
            .padding()
            .navigationTitle("Focus")
        }
    }
}

struct ExercisePage_Previews: PreviewProvider {
    static var previews: some View {
        ExercisePage()
            .environmentObject(UserViewModel())
    }
}
