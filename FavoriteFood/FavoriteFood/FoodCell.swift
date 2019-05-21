//
//  FoodCell.swift
//  FavoriteFood
//
//  Created by Simba on 5/21/19.
//  Copyright © 2019 Simba. All rights reserved.
//

import UIKit
import Alamofire

class FoodCell : UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var food: Food! {
        didSet {
            self.updateUI()
            
        }
    }
    
    func updateUI()
    {
        nameLabel.text = food.name
        descriptionLabel.text = food.description
        
        
        
        if let price = food.price {
            priceLabel.text = "Php \(price)"
        }
        
        
        let imageURL = URL(string: food.imageURL!)
        Alamofire.request(imageURL!).responseData { (responseData) in
            DispatchQueue.main.async {
                if let imageData = responseData.data {
                    self.thumbnailImageView.image = UIImage(data: imageData)
                }
                
            }
        }
        
    }
}

