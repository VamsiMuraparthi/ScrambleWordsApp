//
//  ScoreBoardScreen.swift
//  ScambleWordsApp
//
//  Created by Vamsi on 23/11/25.
//

import SwiftUI

struct ScoreBoardScreen: View {
    private let words: [ScrambledWordModel]
    
    init(words: [ScrambledWordModel]) {
        self.words = words
    }
    
    var body: some View {
        List(words) { word in
            HStack {
                Text(word.word)
                
                Spacer()
                
                Image(systemName: word.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(word.isCorrect ? .green : .red)
            }
        }.navigationBarBackButtonHidden(true)
    }
}
