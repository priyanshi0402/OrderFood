//
//  SplashScreen.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 04/10/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        
        HStack {
            ZStack {
                Color.FFA_451
                    .ignoresSafeArea()
                
                Image(.splashIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 280)
                
            }
            .frame(height: UIScreen.main.bounds.height / 2)
        }
        
        VStack(spacing: 8) {
            Text("Get The Freshest Fruit Salad Combo")
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(._27214_D)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("We deliver the best and freshest fruit salad in town. Order for a combo today!!!")
                .font(.system(size: 16))
                .foregroundStyle(._5_D_577_E)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(EdgeInsets(top: 50, leading: 25, bottom: 0, trailing: 25))
        
        Spacer()
        
        Button {
            print("Button pressed!!")
        } label: {
            Text("Let’s Continue")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
        }
        .frame(width: 327, height: 56)
        .background(Color.FFA_451)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        

        Spacer()
        
    }
}

#Preview {
    SplashView()
}
