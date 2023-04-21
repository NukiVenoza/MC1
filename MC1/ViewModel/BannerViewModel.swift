//
//  BannerViewModel.swift
//  MC1
//
//  Created by Daniel Widjaja on 20/04/23.
//

import Foundation

class BannerViewModel: ObservableObject {
    @Published var quotes = [
        "\"Relax. Take a breath. Let’s pay attention to what is happening; then we’ll figure out what to do.\"\n– Sylvia Boorstein"
    ]
    
    func getRandomQuotes() -> String {
        let randomInt = Int.random(in: 0..<self.quotes.count)
        return self.quotes[randomInt]
    }
}
