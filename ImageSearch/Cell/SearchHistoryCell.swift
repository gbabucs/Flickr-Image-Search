//
//  SearchHistoryCell.swift
//  ImageSearch
//
//  Created by Babu Gangatharan on 7/25/17.
//  Copyright © 2017 Babu Gangatharan. All rights reserved.
//

import UIKit

class SearchHistoryCell: UITableViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var images: UIImageView!
    
    //MARK: Static
    
    static let identifier = "SearchHistoryCell"
    
    //MARK: Static functions
    
    static func dynamicHeight(text: String) -> CGFloat {
        let font = UIFont(name: "Helvetica", size: 14.0)
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: CGFloat.greatestFiniteMagnitude))
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height + 120.0
    }
    
    //MARK: Functions
    
    /**
     Configure cell
     - parameters:
     - for: searchPhoto
     */
    
    func configureCell(for searchPhoto: SearchPhotos) {
        guard let imageData =  searchPhoto.imageData as? Data,
            let image =  UIImage(data: imageData)
            else {
                return
        }
        
        title.text = searchPhoto.url
        images.image = image
        images.contentMode = .scaleAspectFit
    }
    
}
