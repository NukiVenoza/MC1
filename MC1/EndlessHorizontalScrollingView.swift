//
//  EndlessHorizontalScrollingView.swift
//  MC1
//
//  Created by Angela Christabel on 29/04/23.
//

import SwiftUI

struct EndlessHorizontalScrollingView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    @StateObject var bannerVM = BannerViewModel()
    @StateObject var exerciseVM = ExerciseViewModel()
    
    @State var currIndex = 0
    @State var indexes = [1, 2, 0, 1, 2]
    @State var scrollDirection = "none"
    let items: [String] = ["Item 1", "Item 2", "Item 3"]
    
    var body: some View {
        NavigationView {
//            VStack(alignment: .leading) {
//                Text("Choose Focus Exercise")
//                    .font(.title2)
//                    .fontWeight(.bold)
//
//                GeometryReader { geometry in
//                    HStack(spacing: 30) {
//                        ForEach(indexes, id: \.self) { idx in
//                            NavigationLink(destination: ExerciseDetailView(exercise: exerciseVM.exercises[idx])) {
//                                ExerciseCard(exercise: exerciseVM.exercises[idx])
//                            }
//                            .frame(width: 189, height: 292)
//                        }
//                    }
//                    .frame(width: geometry.size.width, alignment: .center)
//                    .modifier(HStackScrollingModifier(items: exerciseVM.exercises.count, itemWidth: 189, itemSpacing: 30, index: $currIndex, direction: $scrollDirection))
//                }
//                .onChange(of: currIndex) { newValue in
//                    // scroll ke kiri
//                    withAnimation {
//                        if scrollDirection == "left" {
//                            if newValue == 2 {
//                                indexes.insert(1, at: 0)
//                            } else if newValue == 1 {
//                                indexes.insert(0, at: 0)
//                            } else {
//                                indexes.insert(2, at: 0)
//                            }
//                        } else if scrollDirection == "right" {
//                            if newValue == 2 {
//                                indexes.append(0)
//                            } else if newValue == 1 {
//                                indexes.append(2)
//                            } else {
//                                indexes.append(1)
//                            }
//                        }
//                    }
//                }
//                .frame(height: 292)
//            }
            
            VStack {
                Text("\(currIndex)")
                GeometryReader { geometry in
                    HStack(spacing: 30) {
                        ForEach(indexes, id: \.self) { idx in
                                ExerciseCard(exercise: exerciseVM.exercises[idx])
                        }
                    }
                    .frame(width: geometry.size.width, alignment: .center)
//                    .modifier(HStackScrollingModifier(items: exerciseVM.exercises.count, itemWidth: 189, itemSpacing: 30, index: $currIndex, direction: $scrollDirection))
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
                .frame(maxWidth: .infinity)
                .frame(width: .infinity, alignment: .center)
            }
        }
    }
}

struct EndlessHorizontalScrollingView_Previews: PreviewProvider {
    static var previews: some View {
        EndlessHorizontalScrollingView()
            .environmentObject(UserViewModel())
    }
}
