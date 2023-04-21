//
//  QuoteModel.swift
//  MC1
//
//  Created by Angela Christabel on 21/04/23.
//

import Foundation

struct Quote: Identifiable {
    var id = UUID()
    var text: String
    var author: String
    
    init(id: UUID = UUID(), text: String, author: String) {
        self.id = id
        self.text = "\"" + text + "\""
        self.author = author
    }
}
