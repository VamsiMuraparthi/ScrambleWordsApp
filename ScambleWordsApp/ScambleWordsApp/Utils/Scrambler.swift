//
//  Scrambler.swift
//  ScambleWordsApp
//
//  Created by Vamsi on 23/11/25.
//

import Foundation

struct Scrambler {
    static func scramble(_ word: String) -> String {
        return String(word.shuffled())
    }
}
