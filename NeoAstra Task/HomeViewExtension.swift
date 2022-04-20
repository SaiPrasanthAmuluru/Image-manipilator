//
//  HomeViewExtension.swift
//  NeoAstra Task
//
//  Created by Sai Prasanth Amuluru on 18/04/22.
//

import Foundation
import UIKit
extension  HomeViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image =  info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        picker.dismiss(animated: true)
        if let EditView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditViewController") as? EditViewController{
            EditView.image = image
            present(EditView,animated: true)
        }
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("image cancel")
        dismiss(animated: true, completion: nil)
    }
}
