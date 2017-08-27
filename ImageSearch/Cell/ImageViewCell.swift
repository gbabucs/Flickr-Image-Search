//
//  ImageViewCell.swift
//  ImageSearch
//
//  Created by Babu Gangatharan on 7/25/17.
//  Copyright © 2017 Babu Gangatharan. All rights reserved.
//

import UIKit
import MapleBacon

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
        imageView.setImage(withUrl: photo.url)
        imageView.contentMode = .scaleAspectFill
        saveImageToCoreData(for: photo)
    }
    
    /**
     Save Image To CoreData
     - parameters: photo object
     - photo: Photo object
     lazy loading from the MapleBacon pod to store the image
     */
    
    func saveImageToCoreData(for photo: Photo) {
        guard let id = Int(photo.id),
            let image = InMemoryStorage.sharedStorage.image(forKey: photo.urlString) else {
                return
        }
        
        let manager = ImageDataManager.shared
    
        if manager.isExist(id: id) == false {
            manager.save(id: id, image: image, url: photo.urlString)
        }
    }
    
}
