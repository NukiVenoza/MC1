//
//  MePage.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import SwiftUI

struct MePage: View {
    @EnvironmentObject var userVM: UserViewModel
    @StateObject var calendarVM = CalendarViewModel()
    
    @State var pushNotification: Bool = true
    @State var vibrationMode: Bool = true
    
    @State private var currentDate = UserDefaults.standard.object(forKey: "notificationDate") as? Date ?? Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!

//    @State private var currentDate = Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!
    
    @State private var showDateModal = false
    @State private var buttonOpacity = 1.0
    
    var currentWeek = [Date]()
    let formatter = DateFormatter()
    
    let notify = NotificationHandler()
    
    
    
    init() {
//        defaultDate = calendar.date(from: dateComponents) ?? Date()
//        currentDate = UserDefaults.standard.object(forKey: "notificationDate") as? Date ?? defaultDate
//        formatter.timeZone = TimeZone(identifier: "GMT+7")

        currentWeek = calendarVM.getDatesOfCurrentWeek()
        formatter.dateFormat = "EEE"
        print(currentDate)
        notify.askPermission()
    }
    
    var body: some View {
        
        NavigationView {
            VStack (spacing: 20){
                Text("Streak")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .foregroundColor(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255, opacity: 100))
                
                HStack (spacing: 14){
                    ForEach(currentWeek, id: \.self) { day in
                        VStack{
                            Text(formatter.string(from: day))
                                .foregroundColor(Color.white)
                                .font(.system(size: 12))
                            
                            ZStack{
                                Circle()
                                    .frame(maxWidth: 30)
                                    .foregroundColor(Color(red: 29 / 255, green: 172 / 255, blue: 155 / 255, opacity: 0.5))
                                
                                if userVM.getExerciseDaysWithoutTimeStamp().contains(userVM.removeTimeStamp(fromDate: day)){
                                    Image("star")
                                        .resizable()
                                        .frame(maxWidth: 25, maxHeight: 25)
                                }
                            }
                            
                        }
                    }
                    
                }
                .frame(maxWidth: 360, maxHeight: 90)
                .background(Color(red: 26 / 255, green: 97 / 255, blue: 88 / 255, opacity: 100))
                .cornerRadius(10)
                
                HStack (spacing: 12){
                    VStack{
                        HStack {
                            Image("star")
                                .resizable()
                                .frame(maxWidth: 32, maxHeight: 32)
                            
                            Text("\(userVM.getCurrentStreak())")
                                .font(.system(size: 24))
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        
                        Text("Current Streak")
                            .font(.system(size: 15))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                    .frame(maxWidth: 174, maxHeight: 72)
                    .background(Color(red: 26 / 255, green: 97 / 255, blue: 88 / 255, opacity: 100))
                    .cornerRadius(10)
                    
                    VStack{
                        HStack {
                            Image("trophy")
                                .resizable()
                                .frame(maxWidth: 32, maxHeight: 32)
                            Text("\(userVM.getHighestStreak())")
                                .font(.system(size: 24))
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        
                        Text("All-time Streak")
                            .font(.system(size: 15))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                    .frame(maxWidth: 174, maxHeight: 72)
                    .background(Color(red: 26 / 255, green: 97 / 255, blue: 88 / 255, opacity: 100))
                    .cornerRadius(10)
                    
                }
                .padding(.top, -10)
                .frame(maxWidth: 360)
                
                Text("Settings")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255, opacity: 100))
                    .padding(.top, 30)
                
                List {
                    Toggle(isOn: $pushNotification) {
                        Text("Push Notification")
                            .font(.system(size: 15))
                            .foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255, opacity: 100))
                            .onChange(of: pushNotification) { value in
                                pushNotification.toggle()
                                
                                if pushNotification == false {
                                    notify.removeNotification(identifier: "notificationID")
                                }
                            }
                    }
                    
                    HStack{
                        Text("Wake Up Time")
                            .font(.system(size: 15))
                            .foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255, opacity: 100))
                        
                        Spacer()
                        
                        DatePicker("Wake Up Time", selection: $currentDate, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .accentColor(pushNotification ? Color(red: 17 / 255, green: 118 / 255, blue: 108 / 255, opacity: 100) : Color(red: 48 / 255, green: 48 / 255, blue: 48 / 255, opacity: 0.5))
                            .onAppear() {
                                notify.sendNotification(
                                    date: currentDate,
                                    type: "date",
                                    title: "Good day, \(userVM.user.name) 🪷",
                                    body: "Prepare your day with some mindfulness activities with us!"
                                )
                            }
                            .onChange(of: currentDate) { time in
                                notify.sendNotification(
                                    date: currentDate,
                                    type: "date",
                                    title: "Good day, \(userVM.user.name) 🪷",
                                    body: "Prepare your day with some mindfulness activities with us!"
                                )
                                UserDefaults.standard.set(currentDate, forKey: "notificationDate")
                            }
                            .disabled(!pushNotification)
                    }
                    
//                    Toggle(isOn: $vibrationMode) {
//                        Text("Vibration Mode")
//                            .font(.system(size: 15))
//                            .foregroundColor(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255, opacity: 100))
//                    }
                    
                    
                }
                .listStyle(PlainListStyle())
                .cornerRadius(10)
                
                
            }
            .padding(.top, 10)
            //            .navigationTitle("Me")
        }
    }
    
}

struct MePage_Previews: PreviewProvider {
    static var previews: some View {
        MePage()
    }
}
