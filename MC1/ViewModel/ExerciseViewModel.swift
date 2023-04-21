//
//  ExerciseViewModel.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    var breath = ExerciseModel(id: 1, name: "3 Minute Breathing", duration: "3 Minutes", desc: "Napas dulu coyy 3 menit aje")
    var bodyScan = ExerciseModel(id: 2, name: "Body Scan", duration: "4 Minutes", desc: "Kalau lu tutup 2 mata lu sambil hembusin nafas, nanti badan lu screenshot")
    var mindfulSound = ExerciseModel(id: 3, name: "Mindful Sound", duration: "5 Minutes", desc: "Coba dengarkan suara hati saya")
    
    @Published var exercises = [ExerciseModel]()
    
    init() {
        self.exercises.append(breath)
        self.exercises.append(bodyScan)
        self.exercises.append(mindfulSound)
    }
}
