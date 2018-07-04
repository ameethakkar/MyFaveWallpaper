//
//  ViewController.swift
//  MyFaveWallpapers
//
//  Created by Amee Thakkar on 7/2/18.
//  Copyright © 2018 Amee Thakkar. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var wallpaperImageView: UIImageView!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var selectImageBtn: UIButton!
    let imagePicker = UIImagePickerController()
    var imagePicked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add New Wallpaper"
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        nameTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let length = textField.text?.count
        {
            characterCountLabel.text = "\(length + 1) characters"
        }
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        {
            imagePicked = true
            wallpaperImageView.image = selectedImage
        }
        dismiss(animated: true)
    }

    @IBAction func selectImgClick(_ sender: Any) {
        
        present(imagePicker, animated: true)
    }
    
    @IBAction func saveClick(_ sender: Any) {
        if !imagePicked || (nameTextField.text?.isEmpty)!
        {
            let alert = UIAlertController(title: "Alert", message: "Name or Image cannot be empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            
            present(alert, animated: true, completion: nil)
        }
        else{
            if let name = nameTextField.text{
                namesArray.append(name)
            }
            imageArray.append(wallpaperImageView.image!)
            
            if let navController = navigationController
            {
                navController.popViewController(animated: true)
            }
        }
    }
    
}

