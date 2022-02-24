//
//  HomeView.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 20.02.2022.
//

import UIKit

class HomeView: BaseView {
    
    private lazy var tableView: MainTableView = {
        let view = MainTableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupView() {
        super.setupView()
        addSubview(tableView)
        
        tableView.expandView(to: self)
    }
    
}
