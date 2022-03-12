//
//  ResponseType.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 24.02.2022.
//

import Foundation

enum ResponseType {
    case loading
    case success(shouldReload: Bool)
    case failure
}
