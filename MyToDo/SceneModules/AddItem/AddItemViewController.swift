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
        return view
    }()
    
    override func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(mainView)
        
        mainView.expandViewWithSafeArea(to: view)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Add new todo item"
        navigationController?.navigationBar.prefersLargeTitles = true
        let item = UIBarButtonItem(title: "Close", style: .plain, target: nil, action: nil)
        navigationItem.setRightBarButton(item, animated: true)
    }
    
}
