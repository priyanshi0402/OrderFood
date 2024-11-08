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
            Dish(name: "Quinoa fruit salad", image: "quinoa_fruit_salad", price: 10, isFavourite: false),
            Dish(name: "Tropical fruit salad", image: "tropical_fruit_salad", price: 20, isFavourite: false),
            Dish(name: "Melon fruit salad", image: "melon_fruit_salad", price: 9, isFavourite: false)
            
        ]
       
    }
}
