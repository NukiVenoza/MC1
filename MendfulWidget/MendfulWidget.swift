//
//  MendfulWidget.swift
//  MendfulWidget
//
//  Created by Daniel Widjaja on 01/05/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), isExercised: false, streak: 10)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), isExercised: true, streak: 10)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        // reset every day, save exercisedate and compare it to today, save exerciseday when exercise done, so when we reset timeline it compares true
        
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate)
//            entries.append(entry)
//        }
        
        // Generate a timeline with one entry that refreshes at midnight.
        let currentDate = Date()
        let startOfDay = Calendar.current.startOfDay(for: currentDate)
        let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!
        
//        let lastExercise = Date()
//        let lastExercise = UserDefaults(suiteName: "group.MC1")?.value(forKey: "lastExercise") as! Date
        
        let isExercised: Bool
        
        if let lastExercise = UserDefaults(suiteName: "group.MC1")?.object(forKey: "lastExercise") as? Date {
            if Calendar.current.isDateInToday(lastExercise) {
                isExercised = true
            } else {
                isExercised = false
            }
        } else {
            // This is the first launch
            isExercised = false
        }
        
//        if Calendar.current.isDateInToday(lastExercise) {
//            isExercised = true
//        } else {
//            isExercised = false
//        }
        
        let entry = SimpleEntry(
            date: startOfDay,
            isExercised: isExercised,
            streak: UserDefaults(suiteName: "group.MC1")?.integer(forKey: "currentStreak") ?? 0)
        entries.append(entry)
        
//        let entry = SimpleEntry(
//            date: startOfDay,
//            isExercised: isExercised,
//            streak: 0)
//        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: .after(endOfDay))
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    
    // is already exercise today
    let isExercised: Bool
    // current streak
    let streak: Int
}

struct MendfulWidgetEntryView : View {
    var entry: Provider.Entry

    var quotesVM = WidgetQuotesViewModel()
    
    var body: some View {
        VStack (spacing: 0){
            HStack {
                
                if entry.isExercised {
                    Image("WidgetStarAfter")
                } else {
                    Image("WidgetStarBefore")
                }
                
                Text("\(entry.streak)")
                    .font(.title)
                    .foregroundColor(
                        entry.isExercised
                        ? Color(red: 26/255, green: 97/255, blue: 88/255)
                        : .gray
                    )
                    .bold()
            }
            .frame(height: 45)
            
            if entry.isExercised {
                Text(quotesVM.getAfter())
                    .font(.footnote)
                    .bold()
                
                Image("WidgetAfter")
                    .frame(height: 85)
                    .offset(y: -18)
            } else {
                Text(quotesVM.getBefore())
                    .font(.footnote)
                    .bold()
                
                Image("WidgetBefore")
                    .frame(height: 85)
                    .offset(y: -5)
            }
            
//            if entry.isExercised {
//                Image("WidgetAfter")
//                    .frame(height: 85)
//                    .offset(y: -18)
//            } else {
//                Image("WidgetBefore")
//                    .frame(height: 85)
//                    .offset(y: -5)
//            }
            
        }
        .preferredColorScheme(.light)
    }
}

struct MendfulWidget: Widget {
    let kind: String = "MendfulWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MendfulWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Mendful")
        .description("Add this widget to keep track of your streak.")
        .supportedFamilies([.systemSmall])
    }
}

struct MendfulWidget_Previews: PreviewProvider {
    static var previews: some View {
        MendfulWidgetEntryView(entry: SimpleEntry(date: Date(), isExercised: true, streak: 14))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
