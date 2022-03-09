//
//  GenericBaseView.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 9.03.2022.
//

import Foundation

class GenericBaseView<T>: BaseView {
    
    var data: T?
    
    func getData() -> T? {
        return data
    }
    
    func setData(with data: T) {
        self.data = data
        reloadViewData()
    }
    
    func reloadViewData() {}
    
}
