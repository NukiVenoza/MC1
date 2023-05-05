//
//  CustomTimelineScheduler.swift
//  MC1
//
//  Created by Angela Christabel on 04/05/23.
//
import Foundation
import SwiftUI

struct CustomTimelineScheduler: TimelineSchedule {
    let timeOffsets: [TimeInterval]
    
    func entries(from startDate: Date, mode: TimelineScheduleMode) -> Entries {
        Entries(last: startDate, offsets: timeOffsets)
    }
    
    struct Entries: Sequence, IteratorProtocol {
        var last: Date
        let offsets: [TimeInterval]
        
        var idx: Int = -1
        
        mutating func next() -> Date? {
            idx += 1
            
            if idx >= offsets.count {
                return nil
            }
            
            last = last.addingTimeInterval(offsets[idx])
            
            return last
        }
    }
}
