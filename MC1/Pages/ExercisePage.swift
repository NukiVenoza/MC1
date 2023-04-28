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
    
    @StateObject var bannerVM = BannerViewModel()
    @StateObject var exerciseVM = ExerciseViewModel()
    @StateObject var page: Page = .first()
    
    @State private var currIndex = 0
    
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
                    Pager(page: page, data: exerciseVM.exercises) { item in
                        NavigationLink(destination: ExerciseDetailView(exercise: item)) {
                            ExerciseCard(exercise: item)
                        }
                    }
                    .pagingPriority(.high)
                    .itemSpacing(30)
                    .interactive(scale: 0.9)
                    .itemAspectRatio(9 / 16)
                    .loopPages(true, repeating: 2)
                    .onPageChanged { index in
                        currIndex = index
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
