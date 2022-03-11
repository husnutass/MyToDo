//
//  CustomButton.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 11.03.2022.
//

import UIKit

class CustomButton: GenericBaseView<CustomButtonData> {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        return button
    }()
    
    override func setupView() {
        addSubview(button)
        
        button.expandView(to: self)
    }
    
    override func reloadViewData() {
        guard let data = getData() else { return }
        button.setTitle(data.title, for: .normal)
        button.backgroundColor = data.backgroundColor
        button.addTarget(nil, action: data.action, for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: data.height).isActive = true
    }
    
}
