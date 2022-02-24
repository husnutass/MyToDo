//
//  TableViewDataProtocol.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 24.02.2022.
//

import Foundation

protocol TableViewDataProtocol {
    func getNumberOfRowsInSection() -> Int
    func getData(in row: Int) -> TodoItem?
}
