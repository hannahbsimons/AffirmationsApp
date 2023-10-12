//
//  ContentView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack() {
                Color(.yellow2).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack(spacing: 16) {
                    Text("Affirmations App")
                        .font(.custom("Futura", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.hotPink)
                    
                    Text("🌸🌼🌺")
                        .font(.title)
                    
                    Spacer().frame(height: 30)
                    
                    NavigationLink(destination: BuildingView()) {
                        Text("AI-powered affirmation suggestions")
                            .foregroundColor(.orange)
                            .font(.custom("Futura", size: 18))
                    }
                    
                    NavigationLink(destination: SelectionView()) {
                        Text("AI-powered affirmation generation")
                            .foregroundColor(.yellow)
                            .font(.custom("Futura", size: 18))
                    }
                    
                    NavigationLink(destination: SpeechView()) {
                        Text("Read your affirmations aloud")
                            .foregroundColor(.green)
                            .font(.custom("Futura", size: 18))
                    }
                    
                    NavigationLink(destination: ReminderView()) {
                        Text("Manage notifications")
                            .foregroundColor(.blue)
                            .font(.custom("Futura", size: 18))
                    }
                    
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
