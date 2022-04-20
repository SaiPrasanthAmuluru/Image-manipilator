//
//  ViewController.swift
//  NeoAstra Task
//
//  Created by Sai Prasanth Amuluru on 18/04/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func addImageClicked(){
        let imagePicker : UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
          let scanAlert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .alert)
          let galleryAction = UIAlertAction(title: "From the Photo Library", style: .default) { UIAlertAction in
              imagePicker.mediaTypes = ["public.image"]
              self.present(imagePicker, animated: true, completion: nil)
          }
          let cameraAction = UIAlertAction(title: "Take a Picture", style: .default) { UIAlertAction in
              imagePicker.mediaTypes = ["public.image"]
              imagePicker.sourceType = .camera
              self.present(imagePicker, animated: true, completion: nil)
          }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { UIAlertAction in
        }
          scanAlert.addAction(galleryAction)
          scanAlert.addAction(cameraAction)
          scanAlert.addAction(cancelAction)
          present(scanAlert,animated: true)
        
    }

}

