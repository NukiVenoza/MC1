//
//  CompletedView.swift
//  MC1
//
//  Created by Angela Christabel on 01/05/23.
//

import SwiftUI

struct CompletedView: View {
    @EnvironmentObject var router: Router
    @State private var starOpacity = false
    @State private var scale = 3.0
    @State private var circleTextOpacity = false
    @State private var streakOpacity = false
    @State private var circleStarScale = 1.0
    
    var body: some View {
        ZStack {
            VStack {
                
            }
            
            VStack(spacing: 16) {
                ZStack {
                    Circle()
                        .size(.init(width: 125, height: 125))
                        .foregroundColor(Color(red: 17/255, green: 118/255, blue: 106/255))
                        .opacity(circleTextOpacity ? 1.0 : 0.0)
                        .scaleEffect(circleStarScale, anchor: .center)
                        .task(delayBadgeScale)
                    
                    Image("star")
                        .resizable()
                        .opacity(starOpacity ? 1.0 : 0.0)
                        .scaleEffect(scale, anchor: .center)
                        .task(delayScale)
                        .frame(width: 100, height: 100)
                    
                    Text("31")
                        .bold()
                        .font(.largeTitle)
                        .offset(y: 30)
                }
                .frame(width: 125, height: 125)
                
                Text("Exercise done!")
                    .opacity(circleTextOpacity ? 1.0 : 0.0)
//                    .task(delayDisappear)
                    .font(.system(size: 24))
                    .bold()
                
                
                Button("Next") {
                    // dipake buat action dulu ya nti ku percantik lagi
                    router.reset()
                }
            }
            .frame(maxWidth: .infinity)
            .onAppear {
                withAnimation(.linear(duration: 1.5)) {
                    circleTextOpacity.toggle()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func delayBadgeScale() async {
        try? await Task.sleep(nanoseconds: 4_000_000_000)
        withAnimation(.easeOut(duration: 1)) {
            circleStarScale = 0.6
        }
    }
    
    func delayScale() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        withAnimation(.easeInOut(duration: 1)) {
            starOpacity.toggle()
            scale = 1.0
        }
        
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        withAnimation(.easeOut(duration: 1)) {
            scale = 0.6
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
    }
}
