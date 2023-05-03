//
//  ExercisePage.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import SwiftUI
import SwiftUIPager

struct ExercisePage: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var router: Router
    
    @StateObject var bannerVM = BannerViewModel()
    @StateObject var exerciseVM = ExerciseViewModel()
    
    @State var currIndex = 0
    @State var indexes = [2, 0, 1]
    @State var scrollDirection = "none"
    @State var isDragging = false
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 50) {
                VStack(alignment: .leading) {
                    Text("Welcome, \(userVM.user.name)")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    // Banner
                    HStack(alignment: .top, spacing: 16) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(
                                Color(red: 17/255, green: 118/255, blue: 106/255)
                            )
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
                        .frame(maxWidth: .infinity)
                        
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
                    
                    GeometryReader { geometry in
                        HStack(spacing: 30) {
                            ForEach(indexes, id: \.self) { idx in
                                NavigationLink(value: exerciseVM.exercises[idx]) {
                                    ExerciseCard(exercise: exerciseVM.exercises[idx])
                                }
                                .simultaneousGesture(DragGesture()
                                    .onChanged({ _ in
                                        self.isDragging = true
                                    })
                                    .onEnded({ _ in
                                        self.isDragging = false
                                    })
                                )
                                .disabled(self.isDragging)
                            }
                        }
                        .frame(width: geometry.size.width, alignment: .center)
                        .modifier(HStackScrollingModifier(items: exerciseVM.exercises.count, itemWidth: 189, itemSpacing: 30, index: $currIndex, direction: $scrollDirection, isDragging: $isDragging))
                    }
                    .onChange(of: currIndex) { _ in
                        // scroll ke kiri
                        if scrollDirection == "left" {
                            if indexes.first! == 2 {
                                indexes.insert(1, at: 0)
                            } else if indexes.first! == 1 {
                                indexes.insert(0, at: 0)
                            } else {
                                indexes.insert(2, at: 0)
                            }
                        } else if scrollDirection == "right" {
                            if indexes.last! == 2 {
                                indexes.append(0)
                            } else if indexes.last! == 1 {
                                indexes.append(2)
                            } else {
                                indexes.append(1)
                            }
                        }
                    }
                    .frame(height: 292)
                    
                    HStack {
                        if currIndex == 0 {
                            Circle()
                                .foregroundColor(Color(red: 17/255, green: 118/255, blue: 106/255))
                                .frame(width: 10, height: 10)
                        } else {
                            Circle()
                                .foregroundColor(Color(red: 217/255, green: 217/255, blue: 217/255))
                                .frame(width: 8, height: 8)
                        }
                        
                        if currIndex == 1 {
                            Circle()
                                .foregroundColor(Color(red: 17/255, green: 118/255, blue: 106/255))
                                .frame(width: 10, height: 10)
                        } else {
                            Circle()
                                .foregroundColor(Color(red: 217/255, green: 217/255, blue: 217/255))
                                .frame(width: 8, height: 8)
                        }
                        
                        if currIndex == 2 {
                            Circle()
                                .foregroundColor(Color(red: 17/255, green: 118/255, blue: 106/255))
                                .frame(width: 10, height: 10)
                        } else {
                            Circle()
                                .foregroundColor(Color(red: 217/255, green: 217/255, blue: 217/255))
                                .frame(width: 8, height: 8)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding()
            .navigationTitle("Focus")
            
            // overlay disini
            VStack {
                
            }
        }
        .navigationDestination(for: ExerciseModel.self) { ex in
            ExerciseDetailView(exercise: ex)
                .environmentObject(router)
                .environmentObject(userVM)
        }
    }
}

struct ExercisePage_Previews: PreviewProvider {
    static var previews: some View {
        ExercisePage()
            .environmentObject(UserViewModel())
            .environmentObject(Router())
    }
}
