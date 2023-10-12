//
//  ReminderView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/11/23.
//

import SwiftUI

struct ReminderView: View {
    @State private var isReminderEnabled = false
    @State private var affirmations: [String] = []
    @State private var isEditing = false
    @State private var showAffirmations = false
    
    var body: some View {
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                
                Text("Enter your affirmations and we will read them aloud to you:")
                    .foregroundColor(.orange)
                    .font(.custom("Futura", size: 18))
                //list of strings
                
                ForEach(0..<affirmations.count, id: \.self) { index in
                    TextField("Affirmation \(index + 1)", text: $affirmations[index])
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }

                Button(action: {
                    affirmations.append("")
                }) {
                    Text("Add Affirmation")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                // list will come from the backend
                if !affirmations.isEmpty {
                    HStack {
                        Button(action: {
                            isEditing = false
                            showAffirmations = true
                        }) {
                            Text("Done")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(10)
                        }

                        Button(action: {
                            affirmations = []
                        }) {
                            Text("Refresh")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                }

                // replace this with the read aloud function
                if showAffirmations {
                    Text("Your affirmations are:")
                        .foregroundColor(.orange)
                        .font(.custom("Futura", size: 18))
                    ForEach(affirmations, id: \.self) { affirmation in
                        Text(affirmation)
                    }
                }

                Spacer().frame(height: 100)
                
                Text("Would you like daily reminders to enunciate your affirmations?")
                    .foregroundColor(.orange)
                    .font(.custom("Futura", size: 18))
                
                HStack(spacing: 20) {
                    Button(action: {
                        isReminderEnabled = true
                    }) {
                        Text("Yes")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        isReminderEnabled = false
                    }) {
                        Text("No")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ReminderView()
}
