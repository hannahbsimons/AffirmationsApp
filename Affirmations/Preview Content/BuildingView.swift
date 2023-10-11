//
//  BuildingView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/11/23.
//

import SwiftUI

struct BuildingView: View {
    var body: some View {
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                
                Text("Use our AI generated suggestions to phrase your affirmations to reflect your aspirations more accurately!")
                    .foregroundColor(.orange)
                    .font(.custom("Futura", size: 18))
                
            }
        }
        .padding()
    }
}

#Preview {
    BuildingView()
}
