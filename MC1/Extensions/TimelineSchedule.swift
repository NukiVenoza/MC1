//
//  TimelineSchedule.swift
//  MC1
//
//  Created by Angela Christabel on 04/05/23.
//

import Foundation
import SwiftUI

extension TimelineSchedule where Self == CustomTimelineScheduler {
    static func cyclic(timeOffsets: [TimeInterval]) -> CustomTimelineScheduler {
            .init(timeOffsets: timeOffsets)
    }
}
