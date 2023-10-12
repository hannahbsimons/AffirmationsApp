//
//  SpeechView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/12/23.
//

import SwiftUI
import AVFoundation

struct SpeechView: View {
    @State private var affirmations: [String] = ["hello"]
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                
                Text("Read your affirmations aloud!")
                    .foregroundColor(.orange)
                    .font(.custom("Futura", size: 18))
                
                if !affirmations.isEmpty {
                    Button(action: {
                        readAffirmations()
                    }) {
                        Text("Read")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding()
    }
    
    func readAffirmations() {
        for affirmation in affirmations {
            let speechUtterance = AVSpeechUtterance(string: affirmation)
            speechSynthesizer.speak(speechUtterance)
        }
    }
}

#Preview {
    SpeechView()
}
