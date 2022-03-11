//
//  NewItem.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 11.03.2022.
//

import Foundation

struct NewItem: Codable {
    let title, todoListDescription: String?

    enum CodingKeys: String, CodingKey {
        case title
        case todoListDescription = "description"
    }
}
