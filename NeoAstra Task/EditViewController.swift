//
//  EditViewController.swift
//  NeoAstra Task
//
//  Created by Sai Prasanth Amuluru on 18/04/22.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var EditingImage: UIImageView!
    var image : UIImage!
    var rotatedDegrees : CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = image{
            EditingImage.image = image
        }
    }
    @IBAction func flipVertically(_ sender : UIButton){
        if let image = EditingImage.image{
            EditingImage.image = flipImageTopBottom(image)
        }
    }
    @IBAction func flipHorizontally(_ sender : UIButton){
        if let image = EditingImage.image{
            EditingImage.image = flipImageLeftRight(image)
        }
    }
    @IBAction func rotateImage(_ sender : UIButton){
        if rotatedDegrees <= 270.0{
            rotatedDegrees += 90.0
               }else{
                   rotatedDegrees = 90.0
               }
        if let image = EditingImage.image{
            EditingImage.image = imageRotatedByDegrees(oldImage: image, deg: rotatedDegrees)
        }
    }
    @IBAction func cropImage(_ sender : UIButton){
        if let cropView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CropImageViewController") as? CropImageViewController{
            cropView.imageCroppedDelegate = self
            if let image = EditingImage.image{
                cropView.cropImage = image
            }
           present(cropView,animated: true)
        }
    }
    func flipImageLeftRight(_ image: UIImage) -> UIImage? {

        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: image.size.width, y: image.size.height)
        context.scaleBy(x: -image.scale, y: -image.scale)
        context.draw(image.cgImage!, in: CGRect(origin:CGPoint.zero, size: image.size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    func flipImageTopBottom(_ image: UIImage) -> UIImage? {

        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: image.size.width/2, y: image.size.height/2)
        context.scaleBy(x: -1, y: 1)
        context.translateBy(x: -image.size.width/2, y: -image.size.height/2)
        context.draw(image.cgImage!, in: CGRect(origin:CGPoint.zero, size: image.size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    @IBAction func saveClicked(_ sender : UIButton){
        if let image = EditingImage.image{
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        dismiss(animated: true)
    }
    func imageRotatedByDegrees(oldImage: UIImage, deg degrees: CGFloat) -> UIImage {
            let rotatedViewBox: UIView = UIView(frame: CGRect(x: 0, y: 0, width: oldImage.size.width, height: oldImage.size.height))
            let t: CGAffineTransform = CGAffineTransform(rotationAngle: degrees * CGFloat.pi / 180)
            rotatedViewBox.transform = t
            let rotatedSize: CGSize = rotatedViewBox.frame.size
            UIGraphicsBeginImageContext(rotatedSize)
            let bitmap: CGContext = UIGraphicsGetCurrentContext()!
            bitmap.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
            bitmap.rotate(by: (degrees * CGFloat.pi / 180))
            bitmap.scaleBy(x: 1.0, y: -1.0)
            bitmap.draw(oldImage.cgImage!, in: CGRect(x: -oldImage.size.width / 2, y: -oldImage.size.height / 2, width: oldImage.size.width, height: oldImage.size.height))
            let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return newImage
        }
}
extension EditViewController : ImageCropDelegate{
    func imageCropped(_cropped image: UIImage?) {
        if let image = image {
            EditingImage.image = image
        }
    }
}
