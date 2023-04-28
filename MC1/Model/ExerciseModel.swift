//
//  ExerciseModel.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import Foundation

struct ExerciseModel: Identifiable, Hashable {
    var id: Int
    var name: String
    var duration: String
    var desc: String
    var backgroundURL: String
    var requirement: [String]
    var icon: String
    
    init(id: Int, name: String, duration: String, desc: String, requirement: [String], icon: String, backgroundURL: String) {
        self.id = id
        self.name = name
        self.duration = duration
        self.desc = desc
        self.backgroundURL = backgroundURL
        self.requirement = requirement
        self.icon = icon
    }
}
