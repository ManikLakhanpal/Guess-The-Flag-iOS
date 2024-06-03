//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Manik Lakhanpal on 01/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .indigo, .indigo, .blue ,.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Spacer()
                Spacer()
                Spacer()
                VStack {
                    Text("Tap the flag of")
                        .font(.title)
                        .foregroundStyle(.yellow)
                        .fontDesign(.rounded)
                        .fontWeight(.black)
                    Text(countries[correctAnswer])
                        .font(.title2)
                        .foregroundStyle(.white)
                        .fontWeight(.regular)
                }
                VStack(spacing: 20) {
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .cornerRadius(15)
                                .shadow(radius: 25)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 30)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Text("Score : \(score)")
                    .foregroundStyle(.white)
                    .fontWeight(.regular)
                    .font(.title3)
                Spacer()
                Spacer()
            }
        }
        .ignoresSafeArea()
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your Score is : \(score)")
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
