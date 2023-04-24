//
//  ExerciseViewModel.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    var breath = ExerciseModel(id: 1, name: "3 Minute Breathing", duration: "3 Minutes", desc: "Napas dulu coyy 3 menit aje", backgroundURL: "Cards/3MB")
    var bodyScan = ExerciseModel(id: 2, name: "Body Scan", duration: "4 Minutes", desc: "Kalau lu tutup 2 mata lu sambil hembusin nafas, nanti badan lu screenshot", backgroundURL: "Cards/BS")
    var mindfulSound = ExerciseModel(id: 3, name: "Mindful Sound", duration: "5 Minutes", desc: "Coba dengarkan suara hati saya", backgroundURL: "Cards/MS")
    
    @Published var exercises = [ExerciseModel]()
    
    init() {
        self.exercises.append(breath)
        self.exercises.append(bodyScan)
        self.exercises.append(mindfulSound)
    }
}
