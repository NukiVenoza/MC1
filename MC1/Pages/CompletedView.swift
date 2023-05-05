//
//  CompletedView.swift
//  MC1
//
//  Created by Angela Christabel on 01/05/23.
//

import SwiftUI

struct CompletedView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var userVM: UserViewModel
    
    @State private var starOpacity = false
    @State private var scale = 3.0
    @State private var circleTextOpacity = false
    @State private var streakOpacity = false
    @State private var circleScale = 1.0
    @State private var offsetY: CGFloat = 0
    @State private var textOpacity = false
    @State private var textHeight = 0.0
    @State private var text = "Exercise done!"
    private let lastText = "days of mindfulness!"
    
//    @State private var btnOpacity = 0.0
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 16) {
                ZStack {
                    Circle()
                        .size(.init(width: 125, height: 125))
                        .foregroundColor(Color(red: 17/255, green: 118/255, blue: 106/255))
                        .opacity(circleTextOpacity ? 1.0 : 0.0)
                        .scaleEffect(circleScale, anchor: .center)
                        .task(delayBadgeScale)

                    Image("star")
                        .resizable()
                        .opacity(starOpacity ? 1.0 : 0.0)
                        .scaleEffect(scale, anchor: .center)
                        .task(delayScale)
                        .frame(width: 100, height: 100)
                }
                .frame(width: 125, height: 125)
                
                Text("\(userVM.getCurrentStreak())")
                    .bold()
                    .font(.system(size: 96, design: .rounded))
//                    .offset(y: 100)
                    .opacity(textOpacity ? 1.0 : 0.0)
                    .frame(height: textHeight)
                
                Text(text)
                    .opacity(circleTextOpacity ? 1.0 : 0.0)
                    .font(.system(size: 24))
                    .bold()
                
                Button {
                    // dipake buat action dulu ya nti ku percantik lagi
                    router.reset()
                } label: {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .font(.system(size: 17))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 0.066, green: 0.463, blue: 0.415))
                        .cornerRadius(10)
                    
                        .padding(.bottom,20)
                        .padding(30)
                }
            }
            .frame(maxWidth: .infinity)
            .transition(AnyTransition.slide)
            .onAppear {
                withAnimation(.linear(duration: 1.5)) {
                    circleTextOpacity.toggle()
    
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            userVM.updateStreak()
        }
    }
    
    func delayBadgeScale() async {
        try? await Task.sleep(nanoseconds: 4_000_000_000)
        withAnimation(.easeOut(duration: 1)) {
            circleScale = 0.6
            scale = 0.6
            offsetY = -80
            textHeight = 60
            textOpacity = true
            text = lastText
        }
    }
    
    func delayScale() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        withAnimation(.easeOut(duration: 1)) {
            starOpacity.toggle()
            scale = 1.0
        }
    }
    
    func delayDisappear() async {
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        withAnimation(.easeOut(duration: 1)) {
            circleTextOpacity.toggle()
        }
    }
}

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView()
            .environmentObject(Router())
            .environmentObject(UserViewModel())
    }
}
