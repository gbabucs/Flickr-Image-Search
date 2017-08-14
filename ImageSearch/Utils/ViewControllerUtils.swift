//
//  ViewControllerUtils.swift
//  ImageSearch
//
//  Created by Babu Gangatharan on 7/25/17.
//  Copyright © 2017 Babu Gangatharan. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerUtils {
    
    //MARK: - Properties
    
    var container = UIView()
    var loadingView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    //MARK: - Functions
    
    /**
     show activity Indicator
     - parameters:
     - uiView: Presenting view
     */
    func showActivityIndicator(uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColorFromHex(rgbValue: 0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    /**
     Hide activity Indicator
     - parameters:
     - uiView: Presenting view
     */
    
    func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    /**
     Returns RBG color from hexdecimal
     - parameters:
     - rgbValue: Hex values of the color
     - alpha: Alpha value of the color
     - return: UIColor
     */
    func UIColorFromHex(rgbValue: UInt32, alpha: Double = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
}


