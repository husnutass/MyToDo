//
//  TodoList.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 23.02.2022.
//

import Foundation

// MARK: - TodoList
struct TodoItem: Codable {
    let documentID: String
    let text, todoListDescription: String?
    let isDone: Int?
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case text, documentID
        case todoListDescription = "description"
        case isDone, createdAt
    }
}
