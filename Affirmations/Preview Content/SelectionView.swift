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
}

#Preview {
    SelectionView()
}
