//
//  WidgetQuotesViewModel.swift
//  MendfulWidgetExtension
//
//  Created by Daniel Widjaja on 02/05/23.
//

import Foundation

struct WidgetQuotesViewModel {
    var beforeQuotes = [
        "Let's be present!",
        "Time to mend!",
        "Be present today!",
        "Let's practice mindfulness!",
        "Let's calm our minds!"
    ]
    
    var afterQuotes = [
        "One step at a time!",
        "Well done!",
        "Proud of you!",
        "Self-care accomplished",
        "Mind, body connected"
    ]
    
    func getBefore() -> String {
        let randomInt = Int.random(in: 0..<self.beforeQuotes.count)
        return self.beforeQuotes[randomInt]
    }
    
    func getAfter() -> String {
        let randomInt = Int.random(in: 0..<self.afterQuotes.count)
        return self.afterQuotes[randomInt]
    }
}
