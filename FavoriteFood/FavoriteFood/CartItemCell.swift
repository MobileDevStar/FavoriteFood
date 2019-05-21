//
//  CartItemCell.swift
//  FavoriteFood
//
//  Created by Simba on 5/21/19.
//  Copyright © 2019 Simba. All rights reserved.
//
import UIKit

class CartItemCell: UITableViewCell
{
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodSubtotalLabel: UILabel!
    
    var cartItem: CartItem! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        quantityLabel.text = String(cartItem.quantity)
        foodNameLabel.text = cartItem.food.name
        foodSubtotalLabel.text = String(Double(cartItem.quantity) * cartItem.food.price!)
    }
}
