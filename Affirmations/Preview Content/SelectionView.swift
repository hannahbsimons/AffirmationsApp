//
//  SelectionView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/11/23.
//

import SwiftUI

struct SelectionView: View {
    var body: some View {
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                
                Text("Select your affirmations")
                    .foregroundColor(.orange)
                    .font(.custom("Futura", size: 18))
                
            }
        }
        .padding()
    }
}

#Preview {
    SelectionView()
}
