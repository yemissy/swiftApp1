//
//  Meal.swift
//  FoodTrackerApp
//
//  Created by Yemisi  on 3/11/19.
//  Copyright © 2019 Yemisi . All rights reserved.
//

import UIKit

class Meal{
    
    //MARK:Properties
    
    var name: String
    var image: UIImage?
    var rating: Int
    
    
    //MARK: Initializer
    
    init?(name:String, image:UIImage, rating:Int){
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
        self.name = name
        self.image = image
        self.rating = rating
    }
}
