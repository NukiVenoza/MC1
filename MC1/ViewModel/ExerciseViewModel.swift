//
//  ExerciseViewModel.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import Foundation

class ExerciseViewModel: ObservableObject {

    var breath = ExerciseModel(id: 1, name: "3 Minutes Breath", duration: "3 Minutes", desc: "Using mindfulness of breathing for short periods at set times and when required. Best for dealing with mind wandering, and learning to be gentle with yourself.", requirement: ["Airpods or a conducive place", "A safe place for sit or lay down", "Turn on focus mode or do not disturb"], icon: "icon3MB", backgroundURL: "Cards/3MB", bg: "bg3MB", audioDuration: 207, audioName: "3MB Audio")
    var bodyScan = ExerciseModel(id: 2, name: "Body Scan", duration: "20 Minutes", desc: "Using mindfulness of breathing for short periods at set times and when required. Best for dealing with mind wandering, and learning to be gentle with yourself.",requirement: ["Airpods or a conducive place", "A safe place for lay down", "Turn on focus mode or do not disturb"], icon: "iconBS", backgroundURL: "Cards/BS",bg: "bgBS", audioDuration: 1200, audioName: "BS Audio")
    var mindfulSound = ExerciseModel(id: 3, name: "Mindful Sound", duration: "5 Minutes", desc: "Using mindfulness of breathing for short periods at set times and when required. Best for dealing with mind wandering, and learning to be gentle with yourself.",requirement: ["Conducive place", "A safe place for sit or lay down", "Turn on focus mode or do not disturb"], icon: "iconMS", backgroundURL: "Cards/MS",bg: "bgMS", audioDuration: 300, audioName: "MS Audio")
    
    @Published var exercises = [ExerciseModel]()
    
    init() {
        self.exercises.append(breath)
        self.exercises.append(bodyScan)
        self.exercises.append(mindfulSound)
    }
}
