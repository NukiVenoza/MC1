//
//  ExerciseModel.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import Foundation

struct ExerciseModel: Identifiable {
    var id: Int
    var name: String
    var duration: String
    var desc: String
    
    init(id: Int, name: String, duration: String, desc: String) {
        self.id = id
        self.name = name
        self.duration = duration
        self.desc = desc
    }
}
