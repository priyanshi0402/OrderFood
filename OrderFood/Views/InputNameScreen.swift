//
//  InputNameView.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 07/10/24.
//

import SwiftUI

struct InputNameView: View {
    
    @State private var firstName: String = ""
    
    var body: some View {
        
        HStack {
            ZStack {
                Color.FFA_451
                    .ignoresSafeArea()
                
                Image(.inputNameSplashIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 307, height: 304)
                
            }
            .frame(height: UIScreen.main.bounds.height / 2)
        }
        
        VStack(spacing: 45) {
            
            VStack(spacing: 12) {
                Text("What is your first name?")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(._27214_D)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomTextField(text: $firstName, placeHolder: "Enter Name")
                
            }
            
            Button {
                print("Button pressed!!")
            } label: {
                Text("Start Ordering")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, minHeight: 56)
            .background(Color.FFA_451)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        .padding(EdgeInsets(top: 50, leading: 25, bottom: 0, trailing: 25))
        
        Spacer()
        
    }
}

#Preview {
    InputNameView()
}
