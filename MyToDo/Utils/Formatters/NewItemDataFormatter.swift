//
//  TodoItemDataFormatter.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 12.03.2022.
//

import Foundation

class NewItemDataFormatter {
    
    class func formatData(data: NewItem) -> [String : Any]? {
        guard let title = data.title else { return nil }
        return ["title" : title, "description" : data.todoListDescription ?? ""]
    }
    
}
