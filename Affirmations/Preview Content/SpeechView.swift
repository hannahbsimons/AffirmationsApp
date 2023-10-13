//
//  SpeechView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/12/23.
//

import SwiftUI
import AVFoundation

struct SpeechView: View {
    @State private var affirmations: [String] = [] // Initialize as an empty array
    let speechSynthesizer = AVSpeechSynthesizer()

    var body: some View {
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)

            VStack(spacing: 16) {
                Text("Affirmations help reframe negative self-talk, build self-confidence,
                and cultivate a positive mindset. By repeating these affirmations regularly,
                you can rewire your subconscious mind and attract positive experiences into your life.")
                    .foregroundColor(.pink)
                    .font(.custom("Futura", size: 18))
                Text("Read your affirmations aloud!")
                    .foregroundColor(.orange)
                    .font(.custom("Futura", size: 18))

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
        .padding()
        .onAppear {
            // Fetch affirmations when the view appears
            fetchAffirmations()
        }
    }

    func fetchAffirmations() {
        guard let url = URL(string: "https://hackathon-affirmations.int.drift.com/get_affirmation_list") else {
            return // Invalid URL
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                do {
                    let affirmationsData = try JSONDecoder().decode([String].self, from: data)
                    
                    // Update the affirmations array on the main thread
                    DispatchQueue.main.async {
                        self.affirmations = affirmationsData
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            } else {
                print("Error fetching affirmations: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
        task.resume()
    }

    func readAffirmations() {
        for affirmation in affirmations {
            let speechUtterance = AVSpeechUtterance(string: affirmation)
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            speechUtterance.rate = 0.52
            self.speechSynthesizer.speak(speechUtterance)
        }
    }
}

#Preview {
    SpeechView()
}
