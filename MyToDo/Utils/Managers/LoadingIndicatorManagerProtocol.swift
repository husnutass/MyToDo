//
//  LoadingIndicatorManagerProtocol.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 9.03.2022.
//

import Foundation

protocol LoadingIndicatorManagerProtocol {
    var loadingViewController: LoadingIndicatorViewController { get }
    
    func startLoading()
    func stopLoading()
}
