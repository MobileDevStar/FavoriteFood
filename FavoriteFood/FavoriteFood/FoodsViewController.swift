//
//  FoodsViewController.swift
//  FavoriteFood
//
//  Created by Simba on 5/21/19.
//  Copyright © 2019 Simba. All rights reserved.
//

import UIKit
import Alamofire

class FoodsViewController: UITableViewController
{
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restoBannerImage: UIImageView!
    
    
    //pass the restaurant foods
    var restaurant: Restaurant!
    var foods = [Food]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        tableView.rowHeight = 140.0
        title = restaurant.name!
        
        restaurantNameLabel.text = restaurant.name
        if let imageURL = URL(string: restaurant.logoURL!) {
            Alamofire.request(imageURL).responseData { (responseData) in
                DispatchQueue.main.async {
                    if let imageData = responseData.data {
                        self.restoBannerImage.image = UIImage(data: imageData)
                        
                    }
                }
            }
            
            
        }
        
        getFoods()
    }
    
    func getFoods()
    {
        Food.getFoods(withRestaurantId: restaurant.id!) { (foods) in
            DispatchQueue.main.async {
                self.foods = foods
                self.tableView.reloadData()
                
            }
        }
    }
}

//Mark: UITableview Datasource
extension FoodsViewController
{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodCell
        cell.food = self.foods[indexPath.row]
        
        return cell
    }
}
