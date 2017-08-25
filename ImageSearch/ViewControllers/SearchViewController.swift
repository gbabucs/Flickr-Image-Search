//
//  SearchViewController.swift
//  ImageSearch
//
//  Created by Babu Gangatharan on 7/25/17.
//  Copyright © 2017 Babu Gangatharan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    //@IBOutlet weak var history: UIButton!

    //MARK: Properties
    
    var photos: [Photo] = []
    var history: [String] = []
    var utils = ViewControllerUtils()
    
    // MARK: - Actions
    
    @IBAction func historyAction(sender: AnyObject) {
        guard history.count > 0 else {
            self.showErrorAlert(fot: "", message: "No history found")
            return
        }
        
        performSegue(withIdentifier: "showHistory", sender: sender)
    }
    
    // MARK: - Private
    
    private func setupView() {
        title = "Flickr 🤡 Image 🤡 Search 🤡"
    }
    
    private func performSearchWithText(searchText: String) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //TODO: If Activity indicator is needed uncomment the below two lines
        //utils.showActivityIndicator(uiView: view)
        ServiceManager.getPhotos(for: searchText, completion: { (error: NSError?, photos: [Photo]?) -> Void in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            //self.utils.hideActivityIndicator(uiView: self.view)
            if error == nil {
                self.photos = photos!
            } else {
                self.photos = []
                if (error!.code == ServiceManager.Errors.errorCode) {
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.showErrorAlert(fot: "Search Error", message: "Invalid Flickr API Key")
                    })
                }
            }
            DispatchQueue.main.async(execute: { () -> Void in
                self.title = searchText
                self.history.append(searchText)
                self.collectionView.reloadData()
            })
        })
    }
    
    private func showErrorAlert(fot title: String, message: String) {
        let alertController = UIAlertController(title: title , message: message , preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK - UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        let screenSize = UIScreen.main.bounds
        let padding: CGFloat = 25
        let screenWidth = screenSize.width
        
        let collectionCellSize = screenWidth - padding
        
        flowLayout.itemSize = CGSize(width: collectionCellSize/2, height: collectionCellSize/2)
        flowLayout.invalidateLayout()
    }
    
    // MARK - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHistory" {
            let historyViewController = segue.destination as! SearchHistoryViewController
            historyViewController.searchHistory = history
        }
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let text = searchBar.text,
            !text.isEmpty else {
                return
        }
        
        performSearchWithText(searchText: text)
    }
    
}

// MARK: - UICollectionViewDataSource

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageViewCell.identifier, for: indexPath) as! ImageViewCell
        
        cell.configureCell(for: photos[indexPath.row])
        return cell
    }
}

