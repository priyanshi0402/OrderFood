//
//  DishViewModel.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 13/10/24.
//

import Foundation

class DishViewModel: ObservableObject {
    
    @Published var dishes: [Dish] = []
    @Published var hottestDishes: [Dish] = []
    
    init() {
        loadDishes()
    }
    
    func loadDishes() {
        dishes = [
            Dish(name: "Honey lime combo", image: "honey_lime_combo", price: 5, isFavourite: false),
            Dish(name: "Berry mango combo", image: "berry_mango_combo", price: 8.5, isFavourite: false),
            Dish(name: "Quinoa fruit salad", image: "quinoa_fruit_salad", price: 10, isFavourite: false),
            Dish(name: "Tropical fruit salad", image: "tropical_fruit_salad", price: 20, isFavourite: false),
            Dish(name: "Melon fruit salad", image: "melon_fruit_salad", price: 9, isFavourite: false)
        ]
        
        hottestDishes = [
            Dish(name: "Quinoa fruit salad", image: "quinoa_fruit_salad", price: 10, isFavourite: false),
            Dish(name: "Tropical fruit salad", image: "tropical_fruit_salad", price: 20, isFavourite: false),
            Dish(name: "Melon fruit salad", image: "melon_fruit_salad", price: 9, isFavourite: false)
        ]
    }
}
