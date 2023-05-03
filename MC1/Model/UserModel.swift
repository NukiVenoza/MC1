//
//  UserModel.swift
//  MC1
//
//  Created by Angela Christabel on 21/04/23.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String
    
    // Streak
    var exerciseDay: [Date]
    var currentStreak: Int
    var highestStreak: Int
}
