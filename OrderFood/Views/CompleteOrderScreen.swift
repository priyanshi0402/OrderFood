//
//  CompleteOrderScreen.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 13/10/24.
//

import SwiftUI

struct CompleteOrderScreen: View {
    
    @ObservedObject private var orderViewModel = OrderViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
                List(orderViewModel.dishes, id: \.id) { dish in
                    CompleteOrderView(dish: dish)
                        .background(.clear)
                }
                .background(.clear)
                
                HStack {
                    VStack {
                        Text("Total")
                        
                        Text("$60,000")
                    }
                }
            }
            
            
            
            
            
        }
        .navigationBarTitle("My Basket", displayMode: .large)
       
    }
}

#Preview {
    CompleteOrderScreen()
}

struct CompleteOrderView: View {
    var dish: Dish
    
    var body: some View {
        VStack {
            HStack {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.F_1_EFF_6)
                        .frame(width: 65, height: 65)
                    
                    Image(dish.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
                
                VStack(spacing: 5) {
                    Text(dish.name)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("2 packs")
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                Text("$\(dish.price)")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(._27214_D)
                
            }
            
        }
    }
}

#Preview {
    CompleteOrderView(
        dish: Dish.init(
            name: "Tropical fruit salad",
            image: .tropicalFruitSalad,
            price: "10,000",
            isFavourite: false
        )
    )
}
