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
                        Text("AI-powered affirmation building")
                            .foregroundColor(.orange)
                            .font(.custom("Futura", size: 18))
                    }
                    
                    NavigationLink(destination: SelectionView()) {
                        Text("End-of-day affirmation selection")
                            .foregroundColor(.orange)
                            .font(.custom("Futura", size: 18))
                    }
                    
                    NavigationLink(destination: ReminderView()) {
                        Text("Read your affirmations aloud")
                            .foregroundColor(.orange)
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
