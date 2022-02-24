//
//  HomeViewModel.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 18.02.2022.
//

import Foundation

class HomeViewModel {
    
    let firestoreManager: FirestoreManager
    var todoList: [TodoItem] = []
    
    init(firestoreManager: FirestoreManager) {
        self.firestoreManager = firestoreManager
    }
    
    
    // MARK: - Service Calls
    func fetchData() {
        firestoreManager.fetchData(collection: .todos, completion: dataHandler)
    }
    
    func saveData() {
        let data = ["text" : "deneme"]
        firestoreManager.saveData(collection: .todos, data: data, completion: saveDataHandler)
    }
    
    // MARK: - Data Handlers
    lazy var dataHandler: FirestoreManager.R = { [weak self] snapshot, error in
        if let error = error {
            print(error.localizedDescription)
        } else if let snapshot = snapshot {
            for document in snapshot.documents {
                self?.todoList.append(TodoListDataFormatter.formatData(data: document.data()))
            }
        }
    }
    
    lazy var saveDataHandler: FirestoreManager.E = { [weak self] error in
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("Success")
        }
    }
    
}
