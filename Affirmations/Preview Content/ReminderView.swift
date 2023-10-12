//
//  ReminderView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/11/23.
//

import SwiftUI

struct ReminderView: View {
    @State private var isReminderEnabled = false
    
    var body: some View {
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                
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
