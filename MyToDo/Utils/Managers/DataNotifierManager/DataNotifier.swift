//
//  DataNotifier.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 12.03.2022.
//

import Foundation

class DataNotifier: DataNotifierProtocol {
    
    static let shared = DataNotifier()
    private var notifiers = [String : ResponseBlock]()
    private let loadingIndicator = LoadingIndicatorManager.shared
    
    private init() {}
    
    func subscribeData(key: String, notifier: @escaping ResponseBlock) {
        notifiers[key] = notifier
    }
    
    func unsubscribeData(key: String) {
        notifiers.removeValue(forKey: key)
    }
    
    func publishData(response: ResponseType) {
        print(response)
        notifiers.forEach { notifier in
            notifier.value(response)
        }
        handleLoading(with: response)
    }
    
    private func handleLoading(with response: ResponseType) {
        switch response {
        case .loading:
            loadingIndicator.startLoading()
        case .success(_):
            loadingIndicator.stopLoading()
        case .failure:
            loadingIndicator.stopLoading()
        }
    }
    
}
