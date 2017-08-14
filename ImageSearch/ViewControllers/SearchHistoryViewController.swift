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
    
    // MARK - UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Recent History"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}

//MARK: UITableViewDataSource

extension SearchHistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = searchHistory?.count,
            count > 0 else {
                
                return 0
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchHistoryCell.identifier, for: indexPath) as? SearchHistoryCell,
            let histories = searchHistory,
            histories.count > 0 else {
                return UITableViewCell()
        }
        
        cell.configureCell(text: histories[indexPath.row])
        
        return cell
    }
}

