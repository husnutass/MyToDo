//
//  AddItemViewController.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 4.03.2022.
//

import UIKit

final class AddItemViewController: BaseViewController<AddItemViewModel> {
    
    private lazy var mainView: AddItemView = {
        let view = AddItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func setupView() {
        setupNavigationBar()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(mainView)
        
        mainView.expandViewWithSafeArea(to: view)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Add new todo item"
    }
    
    
    
}

extension AddItemViewController {
    func saveItem(data: NewItem) {
        print(data)
    }
    
    func cancelAdding() {
        dismiss(animated: true)
    }
}
