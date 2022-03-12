//
//  HomeViewModel.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 18.02.2022.
//

import Foundation

typealias VoidBlock = (() -> Void)
typealias ResponseBlock = ((ResponseType) -> Void)

class HomeViewModel {
    
    private let firestoreManager = FirestoreManager.shared
    private var todoList: [TodoItem] = []
    private let dataNotifier = DataNotifier.shared
    private var itemIndexToBeDeleted: Int?
    
    // MARK: - Service Calls
    func fetchData() {
        dataNotifier.publishData(response: .loading)
        firestoreManager.fetchData(collection: .todos, completion: dataHandler)
    }
    
    func deleteData(document: String) {
        dataNotifier.publishData(response: .loading)
        firestoreManager.deleteData(collection: .todos, document: document, completion: deleteDataHandler)
    }

    
    // MARK: - Data Handlers
    lazy var dataHandler: FirestoreManager.R = { [weak self] snapshot, error in
        if let error = error {
            print(error.localizedDescription)
            self?.dataNotifier.publishData(response: .failure)
        } else if let snapshot = snapshot {
            self?.todoList.removeAll()
            for document in snapshot.documents {
                self?.todoList.append(TodoListDataFormatter.formatData(data: document.data(), documentID: document.documentID))
            }
            self?.dataNotifier.publishData(response: .success(shouldReload: true))
        }
    }
    
    lazy var deleteDataHandler: FirestoreManager.E = { [weak self] error in
        if let error = error {
            print(error.localizedDescription)
            self?.dataNotifier.publishData(response: .failure)
        } else {
            guard let index = self?.itemIndexToBeDeleted else {
                self?.dataNotifier.publishData(response: .failure)
                return
            }
            self?.dataNotifier.publishData(response: .success(shouldReload: false))
        }
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
    
    func deleteItem(at index: Int) {
        itemIndexToBeDeleted = index
        deleteData(document: todoList[index].documentID)
    }
    
}
