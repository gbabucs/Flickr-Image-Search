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
    
    //MARK: Static
    
    static let identifier = "SearchHistoryCell"
    
    //MARK: Functions
    
    /**
     Configure cell
     - parameters:
     - value: Title string
     */
    
    func configureCell(text value: String) {
        title.text = value
    }
    
}
