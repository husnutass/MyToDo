//
//  AddItemView.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 5.03.2022.
//

import UIKit

class AddItemView: BaseView {
    
    weak var delegate: AddItemViewController?
    private var title: String?
    private var todoListDescription: String?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = .addItem
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var inputStackView: UIStackView = {
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
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [saveButton, cancelButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    private lazy var saveButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var cancelButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func setupView() {
        addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(inputStackView)
        containerView.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            
            inputStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
            inputStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            inputStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            
            buttonStackView.topAnchor.constraint(equalTo: inputStackView.bottomAnchor, constant: 60),
            buttonStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        setupViewData()
    }
    
    private func setupViewData() {
        titleTextField.setData(with: ItemTextFieldData(labelText: "Title", textListener: titleListener))
        descriptionTextField.setData(with: ItemTextFieldData(labelText: "Description", textListener: descriptionListener))
        saveButton.setData(with: CustomButtonData(title: "Save", backgroundColor: .systemOrange, action: #selector(saveItem), height: 50))
        cancelButton.setData(with: CustomButtonData(title: "Cancel", backgroundColor: .systemRed, action: #selector(cancelAdding), height: 50))
    }
    
    @objc private func saveItem() {
        guard let title = title, !title.isEmpty else { return }
        let newItem = NewItem(title: title, todoListDescription: todoListDescription)
        delegate?.saveItem(data: newItem)
    }
    
    @objc private func cancelAdding() {
        delegate?.cancelAdding()
    }
    
    private lazy var titleListener: TextListenerBlock = { [weak self] title in
        guard let title = title else { return }
        self?.title = title
    }
    
    private lazy var descriptionListener: TextListenerBlock = { [weak self] desc in
        guard let desc = desc else { return }
        self?.todoListDescription = desc
    }
    
}
