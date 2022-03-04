//
//  TodoListDataFormatter.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 24.02.2022.
//

import Foundation

class TodoListDataFormatter {
    
    class func formatData(data: [String : Any], documentID: String) -> TodoItem {
        return TodoItem(documentID: documentID, text: data["text"] as? String, todoListDescription: data["description"] as? String, isDone: data["isDone"] as? Int, createdAt: data["createdAt"] as? String)
    }
    
}
