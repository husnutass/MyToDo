//
//  ItemTextFieldData.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 9.03.2022.
//

import Foundation

typealias TextListenerBlock = (String?) -> ()

class ItemTextFieldData {
    
    private(set) var labelText: String
    private(set) var textListener: TextListenerBlock
    
    init(labelText: String, textListener: @escaping TextListenerBlock) {
        self.labelText = labelText
        self.textListener = textListener
    }
    
}
