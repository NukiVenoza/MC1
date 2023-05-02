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
        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate)
//            entries.append(entry)
//        }
        
        let entry = SimpleEntry(
            date: currentDate,
            isExercised: UserDefaults.standard.bool(forKey: "widgetIsExercised"),
            streak: UserDefaults.standard.integer(forKey: "widgetStreak"))
        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    
    // exercise status (get from userdefault)
    let isExercised: Bool
    // current streak (get from userdefault)
    let streak: Int
}

struct MendfulWidgetEntryView : View {
    var entry: Provider.Entry

    var quotesVM = WidgetQuotesViewModel()
    
    var body: some View {
//        Text(entry.date, style: .time)
//        if (entry.isExercised == true) {
//
//        }
        
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
            } else {
                Text(quotesVM.getBefore())
                    .font(.footnote)
                    .bold()
            }
            
            if entry.isExercised {
                Image("WidgetAfter")
                    .frame(height: 85)
                    .offset(y: -18)
            } else {
                Image("WidgetBefore")
                    .frame(height: 85)
                    .offset(y: -5)
            }
            
        }
    }
}

struct MendfulWidget: Widget {
    let kind: String = "MendfulWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MendfulWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall])
    }
}

struct MendfulWidget_Previews: PreviewProvider {
    static var previews: some View {
        MendfulWidgetEntryView(entry: SimpleEntry(date: Date(), isExercised: true, streak: 14))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
