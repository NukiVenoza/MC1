//
//  CalendarViewModel.swift
//  MC1
//
//  Created by Daniel Widjaja on 03/05/23.
//

import Foundation

class CalendarViewModel: ObservableObject {
    
    func getDatesOfCurrentWeek() -> [Date] {
        let calendar = Calendar.current
        let today = Date()
        let weekday = calendar.component(.weekday, from: today)
        let daysUntilEndOfWeek = 7 - weekday
        let weekEnd = calendar.date(byAdding: .day, value: daysUntilEndOfWeek, to: today)!
        let weekStart = calendar.date(byAdding: .day, value: -weekday + 1, to: today)!

        var currentWeekDates: [Date] = []
        var date = weekStart
        while date <= weekEnd {
            currentWeekDates.append(date)
            date = calendar.date(byAdding: .day, value: 1, to: date)!
        }

        return currentWeekDates
    }
    
    
}
