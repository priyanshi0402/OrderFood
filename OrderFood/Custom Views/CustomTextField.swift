//
//  CustomTextField.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 07/10/24.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    var placeHolder: String
    var isShowIcon: Bool = false
    
    var body: some View {
        TextField(placeHolder, text: $text)
            .frame(height: 56)
            .padding(.leading)
            .background(Color.F_3_F_1_F_1)
            .clipShape(RoundedRectangle(cornerRadius: 10))
           
            
    }
}


#Preview {
    CustomTextField(text: .constant(""), placeHolder: "Enter Name")
}
