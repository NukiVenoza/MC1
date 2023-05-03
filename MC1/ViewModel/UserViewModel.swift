//
//  UserViewModel.swift
//  MC1
//
//  Created by Angela Christabel on 21/04/23.
//

import Foundation
import WidgetKit

class UserViewModel: ObservableObject {
    // harus tambahin code untuk baca user dari userDefaults
    @Published var user = User(name: "Guest", exerciseDay: [], currentStreak: 0, highestStreak: 0)
    
    func getCurrentStreak() -> Int {
        return user.currentStreak
    }
    
    func getHighestStreak() -> Int {
        return user.highestStreak
    }
    
    func getExerciseDaysWithoutTimeStamp() -> [Date] {
        let exerciseDays = user.exerciseDay
        
        var exerciseDayWithoutTimeStamp = [Date]()
        
        for date in exerciseDays {
            exerciseDayWithoutTimeStamp.append(removeTimeStamp(fromDate: date))
        }
        
        return exerciseDayWithoutTimeStamp
    }
    
    func removeTimeStamp(fromDate: Date) -> Date {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: fromDate)) else {
            fatalError("Failed to strip time from Date object")
        }
        return date
    }
    
    func updateStreak() {
        print(user)
        print(user.exerciseDay.last)
        if Calendar.current.isDateInYesterday(user.exerciseDay.last ?? Date()) {
            print("SINI")
            user.currentStreak += 1

            if user.currentStreak > user.highestStreak {
                user.highestStreak = user.currentStreak
            }
        } else {
            print("ELSE")
            user.currentStreak = 1
            
            if user.highestStreak == 0 {
                user.highestStreak = 1
            }
        }
        
        let currentDate = Date()
        
        if let lastExercise = user.exerciseDay.last {
            if !Calendar.current.isDateInToday(lastExercise) {
                user.exerciseDay.append(currentDate)
            }
        } else {
            // This is the first launch
            user.exerciseDay.append(currentDate)
        }
        // only save 14 record
        if user.exerciseDay.count > 14 {
            user.exerciseDay.removeFirst()
        }
        
        UserDefaults(suiteName: "group.MC1")?.set(user.currentStreak, forKey: "currentStreak")
        UserDefaults(suiteName: "group.MC1")?.set(currentDate, forKey: "lastExercise")
        WidgetCenter.shared.reloadAllTimelines()
        
    }
}
