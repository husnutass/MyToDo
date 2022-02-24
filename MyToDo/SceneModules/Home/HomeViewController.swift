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
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupView() {
        title = "MyToDo"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        view.addSubview(homeView)
        homeView.addSubview(indicatorView)
        
        homeView.expandViewWithSafeArea(to: view)
        indicatorView.centerView(to: homeView)
        
        viewModel.subscribeData(with: dataHandler)
        viewModel.fetchData()
    }
    
    private lazy var dataHandler: ResponseBlock = { [weak self] response in
        DispatchQueue.main.async {
            switch response {
            case .loading:
                self?.indicatorView.startAnimating()
            case .failure:
                self?.indicatorView.stopAnimating()
                self?.homeView.reloadTableView()
                self?.showAlert(title: "Error Occured!")
            case .success:
                self?.indicatorView.stopAnimating()
                self?.homeView.reloadTableView()
            }
        }
    }

}
