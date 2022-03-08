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
        view.spacing = 10
        view.backgroundColor = .systemFill
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
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ])
        mainStackView.expandView(to: containerView)
    }
    
}
