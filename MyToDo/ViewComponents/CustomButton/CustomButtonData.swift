//
//  CustomButtonData.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 11.03.2022.
//

import UIKit

class CustomButtonData {
    
    private(set) var title: String
    private(set) var backgroundColor: UIColor?
    private(set) var action: Selector
    private(set) var height: CGFloat
    
    init(title: String, backgroundColor: UIColor?, action: Selector, height: CGFloat = 40) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.action = action
        self.height = height
    }
    
}
