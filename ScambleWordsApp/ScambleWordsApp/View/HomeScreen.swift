//
//  HomeScreen.swift
//  ScambleWordsApp
//
//  Created by Vamsi on 23/11/25.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel: ScrambleWordsViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: ScrambleWordsViewModel())
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("Scrambled Word Game")
                    .fontWeight(.bold)
                
                Text("Time Remaining: \(viewModel.timeLeft)")
                
                Text(viewModel.jumbledWord)
                    .font(.headline)
                    .fontWeight(.heavy)
                
                TextField(
                    "Guess the word",
                    text: $viewModel.guessedWord
                )
                .textFieldStyle(.roundedBorder)
                
                
                Button("Submit") {
                    viewModel.checkGuess()
                }
                
                NavigationLink(
                    destination: ScoreBoardScreen(words: viewModel.scrambledWord),
                    isActive: $viewModel.didNavigateToResult
                ) {
                    EmptyView()
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    HomeScreen()
}
