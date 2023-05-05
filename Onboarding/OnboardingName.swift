//
//  OnboardingName.swift
//  MC1
//
//  Created by Daniel Widjaja on 05/05/23.
//

import SwiftUI

struct OnboardingName: View {
    
    @State var name = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Onboarding_name")
                    .ignoresSafeArea()
                
                VStack (spacing: 0) {
                    Text("What's your name?")
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                    
                    TextField("Input your name here", text: $name)
                        .frame(width: 350, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                    
//                    Button {
//                        UserDefaults.standard.set(name, forKey: "username")
//                    } label: {
//                        NavigationLink(destination: Onboarding1().preferredColorScheme(.light)) {
//                            Text("Next")
//                                .foregroundColor(Color(red: 17/255, green: 118/255, blue: 106/255))
//                        }
//                    }
                    
                    NavigationLink(destination: Onboarding1().preferredColorScheme(.light)) {
                        Text("Next")
                            .foregroundColor(Color(red: 17/255, green: 118/255, blue: 106/255))
                    }
                    .frame(width: 120, height: 50)
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.white))
                    .padding(.top, 50)
                    .onTapGesture {
                        UserDefaults.standard.set(name, forKey: "username")
                    }

                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct OnboardingName_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingName()
    }
}
