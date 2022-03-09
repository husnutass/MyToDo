//
//  AddItemView.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 5.03.2022.
//

import UIKit

class AddItemView: BaseView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleTextField, descriptionTextField])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = 1
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.borderWidth = 2
        return view
    }()
    
    private lazy var titleTextField: ItemTextField = {
        let textField = ItemTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var descriptionTextField: ItemTextField = {
        let textField = ItemTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func setupView() {
        
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        
        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ])
        mainStackView.expandView(to: containerView)
        
        titleTextField.setData(with: ItemTextFieldData(labelText: "Title"))
        descriptionTextField.setData(with: ItemTextFieldData(labelText: "Description"))
    }
    
}
