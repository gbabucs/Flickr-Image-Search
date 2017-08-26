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
    
    //MARK: Functions
    
    /**
     Configure cell
     - parameters:
     - value: Title string
     */
    
    func configureCell(text value: String, image: UIImage?) {
        title.text = value
        images.image = image
        images.contentMode = .scaleAspectFill
    }
    
}
