//
//  ContentView.swift
//  GuessTheFlag2
//
//  Created by Marko Zivanovic on 2.5.22..
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigera", "Poland", "Russia", "Spain", "UK", "US"]
    
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
    ZStack {
        Color.blue
            .ignoresSafeArea()
      VStack(spacing: 30) {
        VStack {
            Text("Tap the flag")
                .foregroundColor(Color.white)
            Text(countries[correctAnswer])
                .foregroundColor(Color.white)
        }
        ForEach(0..<3) { number in
            Button {
                // Flagg was tapped
            } label: {
                Image(countries[number])
                    .renderingMode(.original)
                }
             }
          }
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
