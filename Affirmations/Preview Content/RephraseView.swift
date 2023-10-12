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
    
    var body: some View {
        
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                
                Text("Use our AI generated suggestions to phrase your affirmations to reflect your aspirations more accurately!")
                    .foregroundColor(.hotPink)
                    .font(.custom("Futura", size: 18))
                
                TextField("Enter an affirmation to rephrase", text: $affirmation_by_user)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Enter a theme", text: $theme)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .onSubmit {
                        fetchAffirmations(affirmation_by_user: affirmation_by_user, theme: theme)
                    }
                
                if showResponse {
                    Text("Your rephrased affirmation is: \(generatedAffirmation)")
                        .font(.custom("Futura", size: 18))
                        .foregroundColor(.orange)
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
