//
//  AddItemViewModel.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 4.03.2022.
//

import Foundation

class AddItemViewModel {
    
    private let firestoreManager = FirestoreManager.shared
    var dataNotifier: ResponseBlock?
    
    func saveData() {
        let data = ["text" : "deneme"]
        dataNotifier?(.loading)
        firestoreManager.saveData(collection: .todos, data: data, completion: saveDataHandler)
    }
    
    // MARK: - Data Handlers
    lazy var saveDataHandler: FirestoreManager.E = { [weak self] error in
        if let error = error {
            print(error.localizedDescription)
            self?.dataNotifier?(.failure)
        } else {
            print("Success")
            self?.dataNotifier?(.success)
        }
    }
    
    // MARK: - Data Subscribables
    func subscribeData(with notifier: @escaping ResponseBlock) {
        dataNotifier = notifier
    }
}
