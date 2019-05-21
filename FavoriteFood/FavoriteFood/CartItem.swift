//
//  CartItem.swift
//  FavoriteFood
//
//  Created by Simba on 5/21/19.
//  Copyright © 2019 Simba. All rights reserved.
//

import Foundation
import SwiftyJSON
import Firebase

class CartItem
{
    var quantity: Int!
    var food: Food!
    
    init(food: Food, quantity: Int)
    {
        self.food = food
        self.quantity = quantity
    }
}
