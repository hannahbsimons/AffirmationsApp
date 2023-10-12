//
//  SpeechView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/12/23.
//

import SwiftUI
import AVFoundation

struct SpeechView: View {
    @State var affirmations: [String] = ["hello"]
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                
                Text("Read your affirmations aloud!")
                    .foregroundColor(.orange)
                    .font(.custom("Futura", size: 24))
                
                if !affirmations.isEmpty {
                    Button(action: {
                        readAffirmations()
                    }) {
                        Text("Read")
                            .foregroundColor(.hotPink)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .font(.custom("Futura", size: 18))
                    }
                }
            }
        }
        .padding()
    }
    
    func readAffirmations() {
        for affirmation in affirmations {
            let speechUtterance = AVSpeechUtterance(string: affirmation)
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            speechUtterance.rate = 0.52
            self.speechSynthesizer.speak(speechUtterance)
        }
    }
    
    func readStuff() {
        //let speechSynthesizer = AVSpeechSynthesizer()
        let speechUtterance = AVSpeechUtterance(string: "Hello")
        speechUtterance.rate = 0.5
        speechUtterance.pitchMultiplier = 1.0
        speechUtterance.volume = 1.0
        speechSynthesizer.speak(speechUtterance)
    }
}

#Preview {
    SpeechView()
}
