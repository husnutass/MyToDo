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
        return view
    }()
    
    override func setupView() {
        title = "MyToDo"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        view.addSubview(homeView)
        
        homeView.expandViewWithSafeArea(to: view)
        
        viewModel.fetchData()
    }

}
