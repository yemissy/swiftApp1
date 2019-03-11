//
//  ViewController.swift
//  FoodTrackerApp
//
//  Created by Yemisi  on 2/28/19.
//  Copyright © 2019 Yemisi . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var mealNameLable: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Handle the textfield user input through delegate's callbacks
        nameTextField.delegate = self
        
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide The Keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLable.text = textField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        //Dismiss the picker if user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        //The info dictionary may contain multiple representation of the image. you want to use the original
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        //Set Imageview, i.e the picture to be seen, set the outlet image view to the selected image in the info Dictionary
        ImageView.image = selectedImage
        
        //Dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    

    

    
    //MARK: Actions
    

        @IBAction func selectImageFromLibrary(_ sender: UITapGestureRecognizer) {
         
        //Hide Keyboard
        nameTextField.resignFirstResponder()

       // UIImagePickerController is a view controller that lets a user pick media from their photo library.
         let imagePicker = UIImagePickerController()

        //This only allows images to be picked not taken.
        imagePicker.sourceType = .photoLibrary

        //Make sure view Controller is notified when an image is picked/selected
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
}

