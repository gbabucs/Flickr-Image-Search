//
//  ViewControllerExtensions.swift
//  ImageSearch
//
//  Created by Babu Gangatharan on 8/26/17.
//  Copyright © 2017 Babu Gangatharan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(fot title: String, message: String) {
        let alertController = UIAlertController(title: title , message: message , preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
