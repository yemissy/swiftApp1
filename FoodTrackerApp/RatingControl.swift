//
//  RatingControl.swift
//  FoodTrackerApp
//
//  Created by Yemisi  on 3/5/19.
//  Copyright © 2019 Yemisi . All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    private var btns = [UIButton]()
    
    //Zero rating means the food got one star, no star slected at all means no rating at all,
    var rating = 0 {
        didSet {
            updateBtnsSelectionState()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        
        didSet{
            setUpButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5 {
        
        didSet {
            setUpButtons()
        }
    }
    

    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpButtons()
    }
    
    //MARK: Private Methods
   
    private func setUpButtons(){
        
        //Clear current Buttons
        
        for button in btns {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        btns.removeAll()
        let bundle = Bundle(for: type(of: self))
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            
            //Create Button
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            //Add Constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the new button to the rating button array
            btns.append(button)
        }
        updateBtnsSelectionState()
        
    }
    
   
    
    //MARK: Action
    @objc func ratingButtonTapped(button: UIButton){
        guard let index = btns.index(of: button) else {
            fatalError("the button \(button) is not in the ratings button array \(btns)")
        }
        
        //Calculate ratings of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating{
        //If the selected star represents the current rating, reset the rating to 0.
        rating = 0
            print("I am the current star number \(selectedRating) and I am the current \(rating) with a rate of \(rating)")
        }
        else {
            rating = selectedRating
            print("I am currently rating the meal  \(rating) and the currently slected number of stars is \(selectedRating)")
            //Other wise set the current rating to the current index of the selected star plus 1
        }
    }
    private func updateBtnsSelectionState(){
        for(index, button) in btns.enumerated(){
            //If the current index of the button is less than the rating value as it will always be then that button should be selected and turned black
            button.isSelected = index < rating
        }
    }
}
