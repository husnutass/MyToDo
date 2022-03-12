//
//  HomeViewController.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 18.02.2022.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    // MARK: - View Components
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = viewModel
        return view
    }()
    
    override func setupView() {
        setupNavigationBar()
        
        view.backgroundColor = .systemBackground
        view.addSubview(homeView)
        
        homeView.expandViewWithSafeArea(to: view)
        
        dataNotifier.subscribeData(key: String(describing: self), notifier: dataHandler)
        viewModel.fetchData()
    }
    
    private func setupNavigationBar() {
        title = "MyToDo"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = UIButton(type: .contactAdd)
        addButton.addTarget(self, action: #selector(openAddItemView), for: .touchUpInside)
        let addButtonItem = UIBarButtonItem(customView: addButton)
        navigationItem.setRightBarButton(addButtonItem, animated: true)
    }
    
    @objc func openAddItemView() {
        present(AddItemViewBuilder.build(), animated: true, completion: nil)
    }
    
    // MARK: - Data Handlers
    private lazy var dataHandler: ResponseBlock = { [weak self] response in
        DispatchQueue.main.async {
            switch response {
            case .success(let reload):
                guard reload else { return }
                self?.homeView.reloadTableView()
            default:
                return
            }
        }
    }
    
    deinit {
        dataNotifier.unsubscribeData(key: String(describing: self))
    }

}
