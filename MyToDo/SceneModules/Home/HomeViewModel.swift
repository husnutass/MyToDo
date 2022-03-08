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
    var dataNotifier: ResponseBlock?
    private var itemIndexToBeDeleted: Int?
    
    // MARK: - Service Calls
    func fetchData() {
        dataNotifier?(.loading)
        firestoreManager.fetchData(collection: .todos, completion: dataHandler)
    }
    
    func deleteData(document: String) {
        dataNotifier?(.loading)
        firestoreManager.deleteData(collection: .todos, document: document, completion: deleteDataHandler)
    }

    
    // MARK: - Data Handlers
    lazy var dataHandler: FirestoreManager.R = { [weak self] snapshot, error in
        if let error = error {
            print(error.localizedDescription)
            self?.dataNotifier?(.failure)
        } else if let snapshot = snapshot {
            for document in snapshot.documents {
                self?.todoList.append(TodoListDataFormatter.formatData(data: document.data(), documentID: document.documentID))
            }
            self?.dataNotifier?(.success)
        }
    }
    
    lazy var deleteDataHandler: FirestoreManager.E = { [weak self] error in
        if let error = error {
            print(error.localizedDescription)
            self?.dataNotifier?(.failure)
        } else {
            guard let index = self?.itemIndexToBeDeleted else {
                self?.dataNotifier?(.failure)
                return
            }
            self?.todoList.remove(at: index)
            self?.dataNotifier?(.success)
        }
    }
    
    // MARK: - Data Subscribables
    func subscribeData(with notifier: @escaping ResponseBlock) {
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
    
    func deleteItem(at index: Int) {
        itemIndexToBeDeleted = index
        deleteData(document: todoList[index].documentID)
    }
    
}
