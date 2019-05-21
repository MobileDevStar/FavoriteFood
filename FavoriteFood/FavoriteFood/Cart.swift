//
//  Cart.swift
//  FavoriteFood
//
//  Created by Simba on 5/21/19.
//  Copyright © 2019 Simba. All rights reserved.
//

import Foundation

class Cart
{
    static let currentCart = Cart()
    
    var restaurant: Restaurant?
    var items = [CartItem]()
    var address: String?
    
    func getTotalQuantity() -> Int {
        var total = 0
        for item in items {
            total += item.quantity!
        }
        return total
    }
    
    func getTotal() -> Double {
        var total = 0.0
        for item in items {
            total += Double(item.quantity) * item.food.price!
        }
        return total
    }
    
    func reset() {
        restaurant = nil
        items.removeAll()
        address = nil
    }
}
