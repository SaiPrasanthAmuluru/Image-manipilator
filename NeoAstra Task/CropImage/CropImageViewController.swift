//
//  CropImageViewController.swift
//  NeoAstra Task
//
//  Created by Sai Prasanth Amuluru on 19/04/22.
//

import UIKit

class CropImageViewController: UIViewController {
    var cropImage = UIImage()
    var imageCroppedDelegate : ImageCropDelegate!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0
            scrollView.maximumZoomScale = 5
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var viewTocrop: UIView! {
        didSet {
            viewTocrop.layer.cornerRadius = 5
            viewTocrop.layer.borderWidth = 3
            viewTocrop.layer.borderColor = UIColor.black.cgColor
        }
    }
    override func viewDidLoad() {
        
        imageView.image = cropImage
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        imageCroppedDelegate.imageCropped(_cropped: imageView.image)
    }
    @IBAction func button_crop_clicked(_ sender: Any) {
        guard let imageToCrop = imageView.image else {
            return
        }
        
        let cropRect = CGRect(x: viewTocrop.frame.origin.x - imageView.realImageRect().origin.x,
                              y: viewTocrop.frame.origin.y - imageView.realImageRect().origin.y,
                              width: viewTocrop.frame.width,
                              height: viewTocrop.frame.height)
        
        let croppedImage = ImageCropHandler.sharedInstance.cropImage(imageToCrop,toRect: cropRect,imageViewWidth: imageView.frame.width,imageViewHeight: imageView.frame.height)
        imageView.image = croppedImage
        scrollView.zoomScale = 1
        dismiss(animated: true)
    }
    
}
extension CropImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
