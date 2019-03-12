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
    var photo: UIImage?
    var rating: Int
    
    
    //MARK: Initializer
    
    init?(name:String, photo:UIImage?, rating:Int){
        
        // Initialization should fail if there is no name or if the rating is negative.
        
        //A guard statement declares a condition that must be true in order for the code after the guard statement to be executed. If the condition is false, the guard statement’s else branch must exit the current code block (for example, by calling return, break, continue, throw, or a method that doesn’t return like fatalError(_:file:line:)).
        
        //Name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
       // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5 ) else{
            return nil 
        }
        
        //Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
