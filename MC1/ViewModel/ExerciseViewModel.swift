//
//  ExerciseViewModel.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    var breath = ExerciseModel(id: 1, name: "3 Minutes Breath", duration: "3:27", desc: "Using mindfulness of breathing for short periods at set times and when required. Best for dealing with mind wandering, and learning to be gentle with yourself.", requirement: ["Airpods or a conducive place", "A safe place to sit or lay down", "Turn on Focus Mode or Do Not Disturb"], icon: "icon3MB", backgroundURL: "Cards/3MB", bg: "bg3MB", audioDuration: 207, audioName: "3MB Audio", tagLine: "In a Hurry")
    
    var bodyScan = ExerciseModel(id: 2, name: "Body Scan", duration: "5:12", desc: "A mindfulness exercise to learn to consciously direct your attention to different parts of your body while focusing on your breath. Increase your awareness of physical sensations to promote relaxation and reduce stress and anxiety.",requirement: ["Airpods or a conducive place", "A safe place to lay down", "Turn on Focus Mode or Do Not Disturb"], icon: "iconBS", backgroundURL: "Cards/BS",bg: "bgBS", audioDuration: 312, audioName: "BS Audio", tagLine: "Here & Now")
    
    var mindfulSound = ExerciseModel(id: 3, name: "Mindful Sound", duration: "3:48", desc: "A mindfulness technique that involves using sounds to anchor your attention to the present moment while focusing on your breath. This exercise can be done anywhere, but it's best to find a quiet and comfortable place where you can sit or lie down without any distractions.",requirement: ["Conducive place", "A safe place to sit or lay down", "Turn on Focus Mode or Do Not Disturb"], icon: "iconMS", backgroundURL: "Cards/MS",bg: "bgMS", audioDuration: 228, audioName: "MS Audio", tagLine: "Where Am I?")
    
    @Published var exercises = [ExerciseModel]()
    @Published var currentEx: ExerciseModel?
    
    init() {
        self.exercises.append(breath)
        self.exercises.append(bodyScan)
        self.exercises.append(mindfulSound)
        self.currentEx = nil
    }
    
    func setCurrentExercise(ex: ExerciseModel) {
        print("changed exercise")
        self.currentEx = ex
    }
    
    func getCurrentExercise() -> ExerciseModel {
        return self.currentEx ?? self.exercises[0]
    }
}
