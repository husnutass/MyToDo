//
//  FirestoreManager.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 23.02.2022.
//

import Foundation
import FirebaseFirestore

class FirestoreManager: ServiceManagerProtocol {
    
    typealias R = FIRQuerySnapshotBlock
    typealias E = ((Error?) -> Void)
    
    private let db = Firestore.firestore()
    
    func fetchData(collection: FirestoreCollection, completion: @escaping R) {
        db.collection(collection.rawValue).getDocuments(completion: completion)
    }
    
    func saveData(collection: FirestoreCollection, data: [String : Any], completion: @escaping E) {
        db.collection(collection.rawValue).addDocument(data: data, completion: completion)
    }
    
    func deleteData(collection: FirestoreCollection, document: String, completion: @escaping E) {
        db.collection(collection.rawValue).document(document).delete(completion: completion)
    }
    
}
