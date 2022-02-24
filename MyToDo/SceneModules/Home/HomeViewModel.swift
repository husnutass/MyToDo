//
//  HomeViewModel.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 18.02.2022.
//

import Foundation

typealias VoidBlock = (() -> Void)

class HomeViewModel {
    
    private let firestoreManager: FirestoreManager
    private var todoList: [TodoItem] = []
    var dataNotifier: VoidBlock?
    
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
        self?.dataNotifier?()
    }
    
    lazy var saveDataHandler: FirestoreManager.E = { [weak self] error in
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("Success")
        }
    }
    
    func subscribeData(with notifier: @escaping VoidBlock) {
        dataNotifier = notifier
    }
    
}

// MARK: - TableViewDataProtocol
extension HomeViewModel: TableViewDataProtocol {
    func getNumberOfRowsInSection() -> Int {
        return todoList.count
    }
    
    func getData(in row: Int) -> TodoItem? {
        return todoList[row]
    }
}
