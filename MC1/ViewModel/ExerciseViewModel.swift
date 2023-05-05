//
//  ExerciseViewModel.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    var bodyScan = ExerciseModel(id: 2, name: "Body Scan", duration: "7 Minutes", desc: "A mindfulness exercise to learn to consciously direct your attention to different parts of your body while focusing on your breath. Increase your awareness of physical sensations to promote relaxation and reduce stress and anxiety.",requirement: ["Airpods or a conducive place", "A safe place to lay down", "Turn on Focus Mode or Do Not Disturb"], icon: "iconBS", backgroundURL: "Cards/BS",bg: "bgBS", audioDuration: 10, audioName: "BS Audio")
    
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
