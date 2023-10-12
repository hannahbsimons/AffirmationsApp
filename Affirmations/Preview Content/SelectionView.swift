//
//  SelectionView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/11/23.
//

import SwiftUI

struct SelectionView: View {
    
    @State private var selectedAffirmation = ""
    @State private var customAffirmation = ""
    @State private var showCustomAffirmation = false
    @State private var showAffirmations = false
    @State private var rephrasedText = ""
    @State var showResponse = false
        
    let affirmations = ["career", "communication", "contribution", "emotional health", "environment", "family", "friendships", "fun and recreation", "mental health", "money and finances", "nutrition", "other", "personal growth", "physical health", "relationships", "self-love", "sleeping", "social", "spirituality"]
        
    
    var body: some View {
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 8) {
                
                Text("Use our AI to generate a list of affirmations to work on!")
                    .foregroundColor(.orange)
                    .font(.custom("Futura", size: 24))
                    .multilineTextAlignment(.center)
                
                Text("Select the area you'd like to focus on:")
                    .foregroundColor(.green)
                    .font(.custom("Futura", size: 18))
                    .multilineTextAlignment(.center)
                
                Picker(selection: $selectedAffirmation, label: Text("")) {
                    ForEach(affirmations, id: \.self) { affirmation in
                        Text(affirmation)
                    }
                    Text("other").tag("other")
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                
                if selectedAffirmation == "other" {
                    TextField("Enter your own affirmation", text: $customAffirmation)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                Button(action: {
                    if selectedAffirmation == "other" {
                        let savedAffirmation = customAffirmation
                    } else {
                        let savedAffirmation = selectedAffirmation
                    }
                    showAffirmations = true
                }) {
                    Text("Done")
                        .foregroundColor(.purple)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .font(.custom("Futura", size: 18))
                }
                
                if showAffirmations {
                    Text("Here's your list of AI-generated affirmations:")
                        .foregroundColor(.hotPink)
                        .font(.custom("Futura", size: 18))
                        .padding()
                        .multilineTextAlignment(.center)
                }
            }
        }
        .padding()
    }
    
    func makePOSTRequest() {
        guard let url = URL(string: "https://hackathon-affirmations.int.drift.com/generate_affirmations/") else {
            return // Invalid URL
        }

        let payload: [String: String] = ["theme": "test-theme"]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: payload)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let data = data {
                    // Assuming the response is a JSON object
                    if let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String],
                        let rephrasedAffirmation = jsonResponse["rephrased_affirmation"] {
                        // Update the UI on the main thread
                        DispatchQueue.main.async {
                            rephrasedText = rephrasedAffirmation
                            showResponse = true
                        }
                    }
                }
            }
            task.resume()
        } catch {
            print("Error: JSON serialization failed")
        }
    }
}

#Preview {
    SelectionView()
}
