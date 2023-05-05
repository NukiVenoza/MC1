//
//  SubtitleModel.swift
//  MC1
//
//  Created by Angela Christabel on 04/05/23.
//

import Foundation
import SwiftUI

struct SubtitleModel: Identifiable {
    var id = UUID()
    var exerciseId: Int
    var subtitles: [Subtitle]
}

struct Subtitle {
    var text: String
    var animation: Animation?
}
