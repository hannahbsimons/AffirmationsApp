//
//  RephraseView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/11/23.
//

import SwiftUI

struct RephraseView: View {
    
    @State var affirmation_by_user = ""
    @State var theme = ""
    @State var showResponse = false
    @State var rephrasedText = "" // To store the rephrased affirmation
    @State private var generatedAffirmation: String = ""
    @State private var selectedTheme = ""
    @State private var customTheme = ""
        
    let affirmationsList = ["career", "communication", "contribution", "emotional health", "environment", "family", "friendships", "fun and recreation", "mental health", "money and finances", "nutrition", "other", "personal growth", "physical health", "relationships", "self-love", "sleeping", "social", "spirituality"]
    
    var body: some View {
        
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                
                Text("Use our AI generated suggestions to phrase your affirmations to reflect your aspirations more accurately!")
                    .foregroundColor(.hotPink)
                    .font(.custom("Futura", size: 24))
                
                TextField("Enter an affirmation to rephrase", text: $affirmation_by_user)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Text("Select the area you'd like to focus on:")
                    .foregroundColor(.hotPink)
                    .font(.custom("Futura", size: 24))
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
                        fetchAffirmations(affirmation_by_user: affirmation_by_user, theme: customTheme)
                    } else {
                        fetchAffirmations(affirmation_by_user: affirmation_by_user, theme: selectedTheme)
                    }
                }) {
                    Text("Rephrase!")
                        .foregroundColor(.purple)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .font(.custom("Futura", size: 24))
                }
                
                
                if showResponse {
                    Text("Your rephrased affirmation is: \(generatedAffirmation)")
                        .font(.custom("Futura", size: 24))
                        .foregroundColor(.hotPink)
                }
            }
        }
        .padding()
    }
    
    func fetchAffirmations(affirmation_by_user: String, theme: String) {
        guard let url = URL(string: "https://hackathon-affirmations.int.drift.com/rephrase") else {
            return // Invalid URL
        }

        // Create a dictionary to represent the parameters
        let parameters = ["affirmation_by_user": affirmation_by_user, "theme": theme]

        do {
            let requestData = try JSONSerialization.data(withJSONObject: parameters)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = requestData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data, error == nil {
                    if let affirmationsData = String(data: data, encoding: .utf8) {
                        DispatchQueue.main.async {
                            self.generatedAffirmation = affirmationsData
                            self.showResponse = true
                        }
                        print(affirmationsData)
                        print(self.generatedAffirmation)
                    } else {
                        print("Error converting data to a string.")
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
    RephraseView()
}
