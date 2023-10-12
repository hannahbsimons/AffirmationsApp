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
                        showResponse = true
                    }
                
                if showResponse {
                    Text("Your rephrased affirmation is: ")
                        .font(.custom("Futura", size: 18))
                        .foregroundColor(.orange)
                    //hi jane! add connection to the endpoint here
                }
            }
        }
        .padding()
    }
}

#Preview {
    BuildingView()
}
