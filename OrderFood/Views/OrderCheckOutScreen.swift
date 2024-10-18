//
//  OrderCheckOutScreen.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 13/10/24.
//

import SwiftUI

struct OrderCheckOutScreen: View {
    
    @ObservedObject private var orderViewModel = OrderViewModel()
    @State private var isPresentingScreen: Bool = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                List(orderViewModel.dishes, id: \.id) { dish in
                    OrderCheckOutView(dish: dish)
                        .background(.clear)
                }
                .background(.clear)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Total")
                            .font(.system(size: 16, weight: .medium))
                        Text("$60,000")
                            .foregroundStyle(Color._27214_D)
                            .font(.system(size: 24, weight: .medium))
                    }
                    
                    Spacer()
                    Button {
                        isPresentingScreen = true
                    } label: {
                        Text("Checkout")
                            .frame(width: 200, height: 56)
                            .background(Color.FFA_451)
                            .foregroundStyle(Color.white)
                            .cornerRadius(10)
                            .font(.system(size: 16, weight: .medium))
                    }
                    .fullScreenCover(isPresented: $isPresentingScreen) {
                        InputCardDetailsView()
                            .presentationBackground(.black.opacity(0.5))
                    }
                    
                }
                .padding()
            }
            .background(.clear)
        }
        .navigationBarTitle("My Basket", displayMode: .large)
        
    }
}

#Preview {
    OrderCheckOutScreen()
}

struct OrderCheckOutView: View {
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
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(dish.name)
                        .font(.system(size: 16, weight: .medium))
                    Text("2 packs")
                        .font(.system(size: 14, weight: .regular))
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
    OrderCheckOutView(
        dish: Dish.init(
            name: "Tropical fruit salad",
            image: .tropicalFruitSalad,
            price: "10,000",
            isFavourite: false
        )
    )
}
