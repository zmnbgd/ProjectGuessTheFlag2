//
//  ContentView.swift
//  GuessTheFlag2
//
//  Created by Marko Zivanovic on 2.5.22..
//

import SwiftUI

struct ContentView: View {
    //MARK: Assignment, present score value in message alert. Firs we need property to store score data.
    @State private var score = 0
    
    @State private var showingScore = false
    @State private var scoretitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
    ZStack {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
        //Color("BackgroundColor")
            .ignoresSafeArea()
        
        VStack {
            Text("Guess The Flag")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
            VStack(spacing: 30) {
            VStack {
                Text("Tap the flag")
                    .foregroundColor(Color.white)
                    .font(.subheadline.weight(.heavy))
                Text(countries[correctAnswer])
                    .foregroundColor(Color.white)
                    .font(.largeTitle.weight(.semibold))
            }
            ForEach(0..<3) { number in
                Button {
                    // Flagg was tapped
                    flagTapped(number)
                } label: {
                    Image(countries[number])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                    //MARK: Shadow adjustment
                        .shadow(color: .black.opacity(0.7), radius: 10, x: 10, y: 10)
                    }
                 }
                Spacer()
            }
            Text("Soce is \(score)")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
            
        }
        .padding()
    }
    .alert(scoretitle, isPresented: $showingScore) {
        Button("Continue", action: askQuestion)
    } message: {
        Text("Your score is \(score)")
    }
    }
    //MARK: Assignment: Second we need to present score data
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoretitle = "Correct!"
            score += 1
        } else {
            scoretitle = "Wrong answer!"
            score -= 1
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
