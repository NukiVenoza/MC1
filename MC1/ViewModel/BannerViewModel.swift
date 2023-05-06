//
//  BannerViewModel.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import Foundation

class BannerViewModel: ObservableObject {
    @Published var quotes = [
        Quote(text: "Relax. Take a breath. Let’s pay attention to what is happening; then we’ll figure out what to do.", author: "Sylvia Boorstein"),
        Quote(text: "The present moment is filled with joy and happiness. If you are attentive, you will see it.", author: "Thich Nhat Hanh"),
        Quote(text: "Everything that has a beginning has an ending. Make your peace with that and all will be well.", author: "Jack Kornfield"),
        Quote(text: "If you want to conquer the anxiety of life, live in the moment, live in the breath.", author: "Amit Ray"),
        Quote(text: "If we learn to open our hearts, anyone, including the people who drive us crazy, can be our teacher.", author: "Pema Chödrön"),
        Quote(text: "You must live in the present, launch yourself on every wave, find your eternity in each moment.", author: "Henry David Thoreau"),
    ]
    
    func getRandomQuotes() -> Quote {
        let randomInt = Int.random(in: 0..<self.quotes.count)
        return self.quotes[randomInt]
    }
}
