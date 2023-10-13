//
//  AboutView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/13/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                Text("Affirmations App")
                    .font(.custom("Futura", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.hotPink)
                
                Text("🌸🌼🌺")
                    .font(.title)
                
                Spacer().frame(height: 30)
                
                Text("Instead of setting goals with the potential for failure, focus on becoming who you want to be. This shift in identity can be achieved through aspirations.")
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.orange)
                    .multilineTextAlignment(.center)
                
                Text("Measure progress through daily improvements to embrace your new identity. This continuous growth sustains motivation.")
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.green)
                    .multilineTextAlignment(.center)
                
                Text("Use positive affirmations to challenge negative thoughts, boost self-esteem, and foster motivation.")
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                
                Text("Practice positive affirmations regularly with the Affirmations App to track your personal growth.")
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.purple)
                    .multilineTextAlignment(.center)

            }
        }
    }
}

#Preview {
    AboutView()
}
