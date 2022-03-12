//
//  AddItemViewModel.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 4.03.2022.
//

import Foundation

class AddItemViewModel {
    
    private let firestoreManager = FirestoreManager.shared
    var dataNotifier = DataNotifier.shared
    
    func saveData(newItem: NewItem) {
        guard let data = NewItemDataFormatter.formatData(data: newItem) else { return }
        dataNotifier.publishData(response: .loading)
        firestoreManager.saveData(collection: .todos, data: data, completion: saveDataHandler)
    }
    
    // MARK: - Data Handlers
    lazy var saveDataHandler: FirestoreManager.E = { [weak self] error in
        if let error = error {
            print(error.localizedDescription)
            self?.dataNotifier.publishData(response: .failure)
        } else {
            self?.dataNotifier.publishData(response: .success(shouldReload: false))
        }
    }

}
