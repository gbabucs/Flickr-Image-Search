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
    
    var history: [SearchPhotos] = []
    
    //MARK: Functions
    
    func setup(){
        title = "History"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        tableView.tableFooterView = UIView.init()
    }
    
    // MARK - UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        history = ImageDataManager.shared.getImages()
        tableView.reloadData()
        
        if history.count < 1 {
            showAlert(fot: "", message: "No history found")
        }
    }
    
}

//MARK: UITableViewDataSource

extension SearchHistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchHistoryCell.identifier, for: indexPath) as? SearchHistoryCell else {
                return UITableViewCell()
        }
        
        cell.configureCell(for: history[indexPath.row])
        
        return cell
    }
    
}

//MARK: UITableViewDelegate

extension SearchHistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let text = history[indexPath.row].url else {
            return 120.0
        }
        
        return SearchHistoryCell.dynamicHeight(text: text)
    }
    
}
