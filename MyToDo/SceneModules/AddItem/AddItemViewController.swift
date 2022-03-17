//
//  AddItemViewController.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 4.03.2022.
//

import UIKit

final class AddItemViewController: BaseViewController<AddItemViewModel> {
    
    // MARK: - View Components
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
        
        dataNotifier.subscribeData(key: identifier, notifier: dataHandler)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Add new todo item"
    }
    
    var responder = UIResponder()
    
    // MARK: - Data Handlers
    private lazy var dataHandler: ResponseBlock = { [weak self] response in
        DispatchQueue.main.async {
            switch response {
            case .success(_):
                self?.dismiss(animated: true)
            default:
                return
            }
        }
    }
    
}

extension AddItemViewController {
    func saveItem(data: NewItem) {
        viewModel.saveData(newItem: data)
    }
    
    func cancelAdding() {
        dismiss(animated: true)
    }
}
