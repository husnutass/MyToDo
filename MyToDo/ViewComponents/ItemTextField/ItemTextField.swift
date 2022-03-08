//
//  ItemTextField.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 6.03.2022.
//

import UIKit

class ItemTextField: BaseView {
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemBackground
        textField.layer.cornerRadius = 10
        textField.borderStyle = .line
        textField.tintColor = .secondarySystemBackground
        return textField
    }()
    
    override func setupView() {
        addSubview(textField)
        
        textField.expandView(to: self, with: 1)
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
