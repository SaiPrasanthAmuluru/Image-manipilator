//
//  ImageCropHandler.swift
//  NeoAstra Task
//
//  Created by Sai Prasanth Amuluru on 19/04/22.
//
import UIKit


struct ImageCropHandler {
        static let sharedInstance = ImageCropHandler()
        func cropImage(_ inputImage: UIImage, toRect cropRect: CGRect, imageViewWidth: CGFloat, imageViewHeight: CGFloat) -> UIImage?
    {
        let imageViewScale = max(inputImage.size.width / imageViewWidth,
                                 inputImage.size.height / imageViewHeight)
                let cropZone = CGRect(x: cropRect.origin.x * imageViewScale,
                              y: cropRect.origin.y * imageViewScale,
                              width: cropRect.size.width * imageViewScale,
                              height: cropRect.size.height * imageViewScale)
                guard let cutImageRef: CGImage = inputImage.cgImage?.cropping(to: cropZone)
            else {
                return nil
        }
                let croppedImage: UIImage = UIImage(cgImage: cutImageRef)
        return croppedImage
    }
}
