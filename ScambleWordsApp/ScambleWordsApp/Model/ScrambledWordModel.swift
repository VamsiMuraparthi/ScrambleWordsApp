//
//  ScrambledWordModel.swift
//  ScambleWordsApp
//
//  Created by Vamsi on 23/11/25.
//


import Foundation

struct ScrambledWordModel: Identifiable {
    let id: UUID
    let word: String
    let timeToGuess: Int
    var isCorrect: Bool
    
    init(
        id: UUID = UUID(),
        word: String,
        timeToGuess: Int? = nil,
        isCorrect: Bool? = nil
    ) {
        self.id = id
        self.word = word
        self.timeToGuess = timeToGuess ?? 20
        self.isCorrect = isCorrect ?? false
    }
}
