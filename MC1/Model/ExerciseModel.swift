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
    var bg: String
    var audioDuration: Double
    var audioName : String
    var tagLine: String
    
    init(id: Int, name: String, duration: String, desc: String, requirement: [String], icon: String, backgroundURL: String, bg: String, audioDuration: Double, audioName: String, tagLine:String) {
        self.id = id
        self.name = name
        self.duration = duration
        self.desc = desc
        self.backgroundURL = backgroundURL
        self.requirement = requirement
        self.icon = icon
        self.bg = bg
        self.audioDuration = audioDuration
        self.audioName = audioName
        self.tagLine = tagLine
    }
}
