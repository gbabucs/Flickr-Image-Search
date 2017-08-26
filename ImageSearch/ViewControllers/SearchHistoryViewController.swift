//
//  SearchHistoryViewController.swift
//  ImageSearch
//
//  Created by Babu Gangatharan on 7/25/17.
//  Copyright © 2017 Babu Gangatharan. All rights reserved.
//

import UIKit

class SearchHistoryViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    
    var recentSearchText: String?
    var searchHistory: [String]?
    var searchedImages: [UIImage] = []
    
    //MARK:
    
    // MARK - UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Recent History"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchedImages = ImageDataManager.shared.getImages()
        if searchedImages.count > 0 {
            self.showAlert(fot: "", message: "No history found")
        }
    }
}

//MARK: UITableViewDataSource

extension SearchHistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchHistoryCell.identifier, for: indexPath) as? SearchHistoryCell else {
                return UITableViewCell()
        }
        
        cell.configureCell(text: "\(indexPath.row)", image: searchedImages[indexPath.row])
        
        return cell
    }
}

