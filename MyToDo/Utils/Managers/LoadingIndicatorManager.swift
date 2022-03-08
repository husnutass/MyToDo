//
//  LoadingIndicatorManager.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 8.03.2022.
//

import UIKit

class LoadingIndicatorManager: LoadingIndicatorManagerProtocol {
    
    static let shared = LoadingIndicatorManager()
    let loadingViewController = LoadingIndicatorViewController()
    
    func startLoading() {
        UIApplication.topViewController()?.view.addSubview(loadingViewController.view)
    }
    
    func stopLoading() {
        loadingViewController.stopAnimating()
    }
}
