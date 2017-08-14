//
//  MARK: Functions          func configureCell(for photo: Photo) {         imageView.sd_setImage(with: photo.swift
//  ImageSearch
//
//  Created by Babu Gangatharan on 7/25/17.
//  Copyright © 2017 Babu Gangatharan. All rights reserved.
//

import UIKit
import SDWebImage

class ImageViewCell: UICollectionViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: Static
    
    static let identifier = "ImageViewCell"
    
    //MARK: Functions
    
    /**
     Configure Cell
     - parameters:
     - photo: Photo object
     */
    
    func configureCell(for photo: Photo) {
        imageView.sd_setImage(with: photo.url)
    }
    
}
