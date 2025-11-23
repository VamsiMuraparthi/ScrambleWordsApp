//
//  ScrambleWordsViewModel.swift
//  ScambleWordsApp
//
//  Created by Vamsi on 23/11/25.
//

import Foundation

class ScrambleWordsViewModel: ObservableObject {
    @Published var guessedWord: String = ""
    @Published var scrambledWord: [ScrambledWordModel] = []
    @Published var round: Int = 0
    @Published var selectedWord: ScrambledWordModel? = nil
    @Published var jumbledWord: String = ""
    @Published var didNavigateToResult: Bool = false
    @Published var timeLeft: Int = 0
    
    private var gcdTimer: DispatchSourceTimer?
    
    init() {
        initializeGame()
    }
    
    func initializeGame() {
        scrambledWord = [
            ScrambledWordModel(word: "Hello"),
            ScrambledWordModel(word: "Hii"),
            ScrambledWordModel(word: "Swift")
        ]
        
        startNewRound()
    }
    
    func startNewRound() {
        if round >= scrambledWord.count {
            didNavigateToResult = true
        } else {
            round += 1
            selectedWord = scrambledWord[round - 1]
            jumbledWord = Scrambler.scramble(selectedWord?.word ?? "")
            timeLeft = selectedWord?.timeToGuess ?? 0
            startTimerForCurrentWord()
        }
    }
    
    func checkGuess() {
        defer {
            guessedWord = ""
        }
        
        if guessedWord.lowercased() == selectedWord?.word.lowercased() {
            scrambledWord[round - 1].isCorrect = true
            startNewRound()
        }
    }
    
}

extension ScrambleWordsViewModel {
    func startTimerForCurrentWord() {
        let queue = DispatchQueue(label: "com.example.ScrambleWordsApp.timerQueue")
        let timer = DispatchSource.makeTimerSource(queue: queue)
        
        timer.schedule(deadline: .now(), repeating: 1)
        
        timer.setEventHandler { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if self.timeLeft > 0 {
                    self.timeLeft -= 1
                } else {
                    self.startNewRound()
                }
            }
        }
        
        timer.resume()
        gcdTimer = timer
    }
}
