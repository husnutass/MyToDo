//
//  ServiceManagerProtocol.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 23.02.2022.
//

import Foundation

protocol ServiceManagerProtocol {
    associatedtype R
    associatedtype E
    
    func fetchData(collection: FirestoreCollection, completion: R)
    func saveData(collection: FirestoreCollection, data: [String : Any], completion: E)
    func deleteData(collection: FirestoreCollection, document: String, completion: E)
}
