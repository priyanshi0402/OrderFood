//
//  Dishes.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 13/10/24.
//

import Foundation
import UIKit

struct Dish {
    var id = UUID()
    var name: String
    var image: String
    var price: Double
    var isFavourite: Bool
}
