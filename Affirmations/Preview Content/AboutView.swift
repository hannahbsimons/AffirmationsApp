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
                
                Text("In general, people think of personal change in terms of goals. But goals imply a dangerous dichotomy: success vs. failure. As soon as we bump into failure, we lose motivation.")
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.orange)
                    .multilineTextAlignment(.center)
                
                Text("Rather than focusing on the goals you want to reach, you should focus on who you want to be. Because behavioural change, overall, implies a change in identity. Once you figure out who or what you want to be, you can express this new identity in terms of aspirations.")
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.green)
                    .multilineTextAlignment(.center)
                
                Text("Progress through aspirations is not measured in success or failure, but in small improvements day to day. It’s in these improvements where you assume a part of your new identity every day. In this way you embody change in a daily basis and it consequently allows motivation to persist over time.")
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                
                Text("A great way to embody this change is with the practice of positive affirmations. Positive affirmations are positively loaded phrases that are used to challenge unhelpful or negative thoughts. People use positive affirmations to generate motivation, encourage positive changes, or boost self-esteem.")
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
