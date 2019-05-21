//
//  Food.swift
//  FavoriteFood
//
//  Created by Simba on 5/21/19.
//  Copyright © 2019 Simba. All rights reserved.
//


import Foundation
import SwiftyJSON
import Firebase

class Food
{
    var id: String?
    var description: String!
    var name: String?
    var imageURL: String?
    var price: Double?
    
    init(json: JSON)
    {
        id = json["id"].string
        name = json["name"].string
        price = json["price"].double
        description = json["description"].string
        imageURL = json["imageURL"].string
        
    }
    
    class func getFoods(withRestaurantId restaurantId: String, completion: @escaping ([Food]) -> Void)
    {
        let ref = Database.database().reference().child("restaurants/\(restaurantId)/foods")
        ref.observeSingleEvent(of: .value) { (snapshot) in
            var foods = [Food]()
            for childSnapshot in snapshot.children {
                let foodJSON = JSON((childSnapshot as! DataSnapshot ).value)
                let food = Food(json: foodJSON)
                foods.append(food)
            }
            
            completion(foods)
            
            
        }
    }
}
