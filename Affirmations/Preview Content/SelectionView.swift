//
//  SelectionView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/11/23.
//

import SwiftUI

struct SelectionView: View {
    
    @State private var selectedAffirmation = "Placeholder 1"
    @State private var customAffirmation = ""
    @State private var showCustomAffirmation = false
        
    let affirmations = ["Select", "Placeholder 2", "Placeholder 3", "Placeholder 4", "Placeholder 5", "Placeholder 6", "Placeholder 7", "Placeholder 8", "Placeholder 9", "Placeholder 10"]
        
    
    var body: some View {
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                
                Text("Use our AI to generate a list of affirmations to work on!")
                    .foregroundColor(.orange)
                    .font(.custom("Futura", size: 18))
                
                Text("Select the area you'd like to focus on:")
                    .foregroundColor(.orange)
                    .font(.custom("Futura", size: 18))
                
                // drop down
                // include an "other" for them to type in
                
                Picker(selection: $selectedAffirmation, label: Text("")) {
                    ForEach(affirmations, id: \.self) { affirmation in
                        Text(affirmation)
                    }
                    Text("Other").tag("Other")
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                
                if selectedAffirmation == "Other" {
                    TextField("Enter your own affirmation", text: $customAffirmation)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                if selectedAffirmation != "Select" {
                    Text("Your new affirmations are:")
                        .foregroundColor(.orange)
                        .font(.custom("Futura", size: 18))
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    SelectionView()
}
