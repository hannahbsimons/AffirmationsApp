//
//  BuildingView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/11/23.
//

import SwiftUI

struct BuildingView: View {
    
    @State var affirmationText = ""
    @State var showResponse = false
    @State var rephrasedText = "" // To store the rephrased affirmation
    
    var body: some View {
        
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                
                Text("Use our AI generated suggestions to phrase your affirmations to reflect your aspirations more accurately!")
                    .foregroundColor(.orange)
                    .font(.custom("Futura", size: 18))
                
                TextField("Enter an affirmation to rephrase", text: $affirmationText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .onSubmit {
                        makePOSTRequest()
                    }
                
                if showResponse {
                    Text("Your rephrased affirmation is: \(rephrasedText)")
                        .font(.custom("Futura", size: 18))
                        .foregroundColor(.orange)
                }
            }
        }
        .padding()
    }
    func makePOSTRequest() {
        guard let url = URL(string: "https://hackathon-affirmations.blahblah.com/rephrase/") else {
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
    BuildingView()
}
