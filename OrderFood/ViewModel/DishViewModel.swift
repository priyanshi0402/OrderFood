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
            Dish(name: "Honey lime combo", image: .honeyLimeCombo, price: "2,000", isFavourite: false),
            Dish(name: "Berry mango combo", image: .berryMangoCombo, price: "8,000", isFavourite: false),
            Dish(name: "Quinoa fruit salad", image: .quinoaFruitSalad, price: "10,000", isFavourite: false),
            Dish(name: "Tropical fruit salad", image: .tropicalFruitSalad, price: "10,000", isFavourite: false),
            Dish(name: "Melon fruit salad", image: .melonFruitSalad, price: "10,000", isFavourite: false)
        ]
        
        hottestDishes = [
            Dish(name: "Quinoa fruit salad", image: .quinoaFruitSalad, price: "10,000", isFavourite: false),
            Dish(name: "Tropical fruit salad", image: .tropicalFruitSalad, price: "10,000", isFavourite: false),
            Dish(name: "Melon fruit salad", image: .melonFruitSalad, price: "10,000", isFavourite: false)
        ]
    }
}
