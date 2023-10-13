//
//  GenerationView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/11/23.
//

import SwiftUI

struct GenerationView: View {
    
    @State private var selectedTheme = ""
    @State private var customTheme = ""
    @State private var showThemes = false
    @State private var generatedAffirmations: [String] = []
    @State private var affirmations: [String] = []
        
    let affirmationsList = ["career", "communication", "contribution", "emotional health", "environment", "family", "friendships", "fun and recreation", "mental health", "money and finances", "nutrition", "other", "personal growth", "physical health", "relationships", "self-love", "sleeping", "social", "spirituality"]
        
    
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
                
                Picker(selection: $selectedTheme, label: Text("")) {
                    ForEach(affirmationsList, id: \.self) { affirmation in
                        Text(affirmation)
                    }
                    Text("other").tag("other")
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                
                if selectedTheme == "other" {
                    TextField("Enter your own focus area", text: $customTheme)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                Button(action: {
                    if selectedTheme == "other" {
                        fetchAffirmations(theme: customTheme)
                    } else {
                        fetchAffirmations(theme: selectedTheme)
                    }
                }) {
                    Text("Generate!")
                        .foregroundColor(.purple)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .font(.custom("Futura", size: 18))
                }
                
                if showThemes {
                   Text("Here's your list of AI-generated affirmations:")
                       .foregroundColor(.hotPink)
                       .font(.custom("Futura", size: 18))
                       .padding()
                       .multilineTextAlignment(.center)
                   
                   ForEach(generatedAffirmations, id: \.self) { affirmation in
                       Text(affirmation)
                           .foregroundColor(.hotPink)
                           .font(.custom("Futura", size: 18))
                           .padding()
                   }
               }
            }
        }
        .padding()
    }
    
    func fetchAffirmations(theme: String) {
        guard let url = URL(string: "https://hackathon-affirmations.int.drift.com/generate_affirmations") else {
            return // Invalid URL
        }

        // Create a dictionary to represent the parameters
        let parameters = ["theme": theme]

        do {
            let requestData = try JSONSerialization.data(withJSONObject: parameters)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = requestData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data, error == nil {
                    do {
                        let affirmationsData = try JSONDecoder().decode([String].self, from: data)
                        
                        DispatchQueue.main.async {
                            self.generatedAffirmations = affirmationsData
                            showThemes = true
                        }
                        print(affirmationsData)
                        print(self.generatedAffirmations)
                        
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                } else {
                    print("Error fetching affirmations: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
            task.resume()
            
        } catch {
            print("Error encoding request parameters: \(error.localizedDescription)")
        }
    }
}

#Preview {
    GenerationView()
}
