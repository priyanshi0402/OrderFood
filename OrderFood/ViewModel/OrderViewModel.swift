//
//  OrderViewModel.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 13/10/24.
//

import Foundation

class OrderViewModel: ObservableObject {
    
    @Published var dishes: [Dish] = []
    
    init() {
        loadDishes()
    }
    
    func loadDishes() {
        dishes = [
            Dish(name: "Quinoa fruit salad", image: .quinoaFruitSalad, price: "10,000", isFavourite: false),
            Dish(name: "Melon fruit salad", image: .melonFruitSalad, price: "10,000", isFavourite: false),
            Dish(name: "Tropical fruit salad", image: .tropicalFruitSalad, price: "10,000", isFavourite: false)
            
        ]
       
    }
}
