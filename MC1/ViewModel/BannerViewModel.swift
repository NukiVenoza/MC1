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
//        Quote(text: "The mind is everything. What you think you become.", author: "Buddha"),
        Quote(text: "The present moment is filled with joy and happiness. If you are attentive, you will see it.", author: "Thich Nhat Hanh"),
        Quote(text: "Everything that has a beginning has an ending. Make your peace with that and all will be well.", author: "Jack Kornfield"),
//        Quote(text: "The little things? The little moments? They aren’t little.", author: "Jon Kabat-Zinn"),
//        Quote(text: "The only way to live is by accepting each minute as an unrepeatable miracle.", author: "Tara Brach"),
        Quote(text: "If you want to conquer the anxiety of life, live in the moment, live in the breath.", author: "Amit Ray"),
//        Quote(text: "Do every act of your life as though it were the very last act of your life.", author: "Marcus Aurelius"),
//        Quote(text: "The quieter you become, the more you can hear.", author: "Ram Dass"),
//        Quote(text: "The present moment is the only time over which we have dominion.", author: "Thich Nhat Hanh"),
//        Quote(text: "Be where you are, not where you think you should be.", author: "Thich Nhat Hanh"),
//        Quote(text: "You can’t stop the waves, but you can learn to surf.", author: "Jon Kabat-Zinn"),
//        Quote(text: "As soon as we wish to be happier, we are no longer happy.", author: "Walter Landor"),
//        Quote(text: "We are all just walking each other home.", author: "Ram Dass"),
//        Quote(text: "Everything that irritates us about others can lead us to an understanding of ourselves.", author: "Carl Jung"),
//        Quote(text: "In the beginner’s mind there are many possibilities, but in the expert’s there are few.", author: "Shunryu Suzuki"),
//        Quote(text: "Be present in all things and thankful for all things.", author: "Maya Angelou"),
        Quote(text: "If we learn to open our hearts, anyone, including the people who drive us crazy, can be our teacher.", author: "Pema Chödrön"),
//        Quote(text: "Suffering usually relates to wanting things to be different than they are.", author: "Allan Lokos"),
        Quote(text: "You must live in the present, launch yourself on every wave, find your eternity in each moment.", author: "Henry David Thoreau"),
    ]
    
    func getRandomQuotes() -> Quote {
        let randomInt = Int.random(in: 0..<self.quotes.count)
        return self.quotes[randomInt]
    }
}
