//
//  InputCardDetailsView.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 16/10/24.
//

import SwiftUI

struct InputCardDetailsView: View {
    
    @State private var cardHolderName: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(alignment: .center) {
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(.icCancel)
            }
            .padding(.bottom, 16)
            
            VStack {
                VStack(alignment: .leading, spacing: 24) {
                    CardInputTexView(title: "Card Holders Name", placeHolder: "Ngolo Kante", text: $cardHolderName)
                    
                    CardInputTexView(title: "Card Number", placeHolder: "1234 5678 9012 1314", text: $cardHolderName)
                    
                    HStack(spacing: 50) {
                        CardInputTexView(title: "Date", placeHolder: "10/30", text: $cardHolderName)
                        CardInputTexView(title: "CVV", placeHolder: "123", text: $cardHolderName)
                    }
                }.padding(24)
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .center) {
                        Button {
                            
                        } label: {
                            Text("Complete Order")
                                .foregroundStyle(.FFA_451)
                                .frame(width: 150, height: 56)
                                .background(Color.white)
                                .font(.system(size: 16, weight: .medium))
                                .cornerRadius(10)
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 96)
                .background(Color.FFA_451)
                .clipShape(
                    .rect(
                        topLeadingRadius: 24,
                        topTrailingRadius: 24,
                        style: .continuous
                    )
                )
            }
            .background(Color.white)
            .clipShape(
                .rect(
                    topLeadingRadius: 24,
                    topTrailingRadius: 24,
                    style: .continuous
                )
            )
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    InputCardDetailsView()
}

struct CardInputTexView: View {
    
    var title: String
    var placeHolder: String
    @Binding var text: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .foregroundStyle(Color._27214_D)
                .font(.system(size: 20, weight: .medium))
                
            CustomTextField(text: $text, placeHolder: placeHolder)
        }
    }
}
