//
//  MePage.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import SwiftUI

struct MePage: View {
    
    var body: some View {
        
        @State var currentTime = getTime()
        
        NavigationView {
            VStack (spacing: 20){
                Text("Streak")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .foregroundColor(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255, opacity: 100))
                
                HStack (spacing: 14){
                    VStack{
                        Text("Su")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                        Circle()
                            .frame(maxWidth: 30)
                            .foregroundColor(.white)
                    }
                    
                    VStack{
                        Text("Mo")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                        Circle()
                            .frame(maxWidth: 30)
                            .foregroundColor(.white)
                    }
                    
                    VStack{
                        Text("Tu")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                        Circle()
                            .frame(maxWidth: 30)
                            .foregroundColor(.white)
                    }
                    
                    VStack{
                        Text("We")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                        Circle()
                            .frame(maxWidth: 30)
                            .foregroundColor(.white)
                    }
                    
                    VStack{
                        Text("Th")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                        Circle()
                            .frame(maxWidth: 30)
                            .foregroundColor(.white)
                    }
                    
                    VStack{
                        Text("Fr")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                        Circle()
                            .frame(maxWidth: 30)
                            .foregroundColor(.white)
                    }
                    
                    VStack{
                        Text("Sa")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                        Circle()
                            .frame(maxWidth: 30)
                            .foregroundColor(.white)
                    }
                    
                }
                .frame(maxWidth: 360, maxHeight: 90)
                .background(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 100.0))
                .cornerRadius(10)
                
                HStack (spacing: 12){
                    VStack{
                        
                        Text("🔥 12")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        
                        Text("Current Streak")
                            .font(.system(size: 16))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                    .frame(maxWidth: 174, maxHeight: 66)
                    .background(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 0.17))
                    .cornerRadius(10)
                    
                    VStack{
                        Text("🏆 32")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        
                        Text("Current Streak")
                            .font(.system(size: 16))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                    .frame(maxWidth: 174, maxHeight: 66)
                    .background(Color(red: 17 / 255, green: 118 / 255, blue: 106 / 255, opacity: 0.17))
                    .cornerRadius(10)
                    
                }
                .frame(maxWidth: 360)
                
                Text("Settings")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255, opacity: 100))
                
                List {
                    Toggle(isOn: .constant(true)) {
                        Text("Push Notification")
                            .font(.system(size: 15))
                            .foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255, opacity: 100))
                        
                    }
                    
                    HStack{
                        Text("Wake Up Time")
                            .font(.system(size: 15))
                            .foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255, opacity: 100))
                        
                        Spacer()
                        
                        TextField("Current Time", text: $currentTime)
                            .font(.system(size: 15))
                            .foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255, opacity: 100))
                            .frame(width: 80, height: 34)
                            .background(Color(red: 118 / 255, green: 118 / 255, blue: 128 / 255, opacity: 0.12))
                            .cornerRadius(8)
                            .multilineTextAlignment(.center)
                    }
                    
                    Toggle(isOn: .constant(true)) {
                        Text("Vibration Mode")
                            .font(.system(size: 15))
                            .foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255, opacity: 100))
                    }
                    
                }
                //                .scrollContentBackground(.hidden)
                .background(Color.white)
                .cornerRadius(10)
                
            }
            .navigationTitle("Me")
        }
    }
    
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        return dateString
        
    }
}

struct MePage_Previews: PreviewProvider {
    static var previews: some View {
        MePage()
    }
}
