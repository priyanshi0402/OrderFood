//
//  Order.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 29/10/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class DishOrder {
    
    var orderId = UUID()
    var name: String
    var image: String
    var price: Double
    var quantity: Int
    var isFavourite: Bool
    
    init(orderId: UUID = UUID(), name: String, image: String, price: Double, quantity: Int, isFavourite: Bool) {
        self.orderId = orderId
        self.name = name
        self.image = image
        self.price = price
        self.isFavourite = isFavourite
        self.quantity = quantity

    }
}
