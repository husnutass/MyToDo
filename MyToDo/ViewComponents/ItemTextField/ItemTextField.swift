//
//  ItemTextField.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 6.03.2022.
//

import UIKit

class ItemTextField: GenericBaseView<ItemTextFieldData> {
    
    private var listener: TextListenerBlock?
    weak var delegate: AddItemView?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [textLabel, labelBorder, textField])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        view.axis = .horizontal
        view.distribution = .fill
        return view
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var labelBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .secondarySystemBackground
        textField.delegate = self
        textField.addTarget(self, action: #selector(catchTextChanges), for: .editingChanged)
        return textField
    }()
    
    override func setupView() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        containerView.expandView(to: self)
        mainStackView.expandView(to: containerView, top: 0, bottom: 0, leading: 10, trailing: -10)
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 50),
            textLabel.widthAnchor.constraint(equalToConstant: 80),
            labelBorder.widthAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func reloadViewData() {
        guard let data = getData() else { return }
        textLabel.text = data.labelText
        listener = data.textListener
    }
    
    @objc private func catchTextChanges(_ sender: UITextField) {
        guard let text = sender.text else { return }
        listener?(text)
    }
    
}

// MARK: - UITextFieldDelegate
extension ItemTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.closeKeyboard()
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.moveViewUp(by: 200)
    }
}
