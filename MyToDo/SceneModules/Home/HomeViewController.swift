//
//  HomeViewController.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 18.02.2022.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
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
        
        viewModel.subscribeData(with: dataHandler)
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
    
    private func showIndicatorView() {
        LoadingIndicatorManager.shared.startLoading()
    }
    
    private func hideIndicatorView() {
        LoadingIndicatorManager.shared.stopLoading()
    }
    
    private lazy var dataHandler: ResponseBlock = { [weak self] response in
        DispatchQueue.main.async {
            switch response {
            case .loading:
                self?.showIndicatorView()
            case .failure:
                self?.hideIndicatorView()
                self?.homeView.reloadTableView()
                self?.showAlert(title: "Error Occured!")
            case .success:
                self?.hideIndicatorView()
                self?.homeView.reloadTableView()
            }
        }
    }

}
