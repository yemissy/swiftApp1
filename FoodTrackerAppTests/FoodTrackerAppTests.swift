//
//  FoodTrackerAppTests.swift
//  FoodTrackerAppTests
//
//  Created by Yemisi  on 2/28/19.
//  Copyright © 2019 Yemisi . All rights reserved.
//

import XCTest
@testable import FoodTrackerApp

class FoodTrackerAppTests: XCTestCase {

    //MARK: Meal Class Test
    
    //Confirm that the meal initializer returns a meal object when passed valid parameters
    func testMealInitializationSuceeds(){
        
        //Zero rating
        let zeroRatingMeal = Meal.init(name: "friedRice", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        //Highest Positive Rating
        let positiveRatingMeal = Meal.init(name: "friedRice", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    func testMealInitializationFails(){
        //Confirm that the meal initializer returns nil when a negative rating is passed or an empty name is passed
        
        //Negative Rating
        let negativeRating = Meal.init(name: "friedRice", photo: nil, rating: -1)
        XCTAssertNil(negativeRating)
        
        
        //Rating Exceeds Maximum
        let largeRating = Meal.init(name: "rice", photo: nil, rating: 6)
        XCTAssertNil(largeRating)
        
        //Empty string
        let emptyString = Meal.init(name: "", photo: nil, rating: 5)
        XCTAssertNil(emptyString)
    }

}
