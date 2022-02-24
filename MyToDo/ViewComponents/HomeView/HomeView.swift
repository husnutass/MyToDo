//
//  HomeView.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 20.02.2022.
//

import UIKit

class HomeView: BaseView {
    
    var delegate: TableViewDataProtocol?
    
    private lazy var tableView: MainTableView = {
        let view = MainTableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func setupView() {
        super.setupView()
        addSubview(tableView)
        
        tableView.expandView(to: self)
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
}

// MARK: - TableViewDataProtocol
extension HomeView: TableViewDataProtocol {
    func getNumberOfRowsInSection() -> Int {
        return delegate?.getNumberOfRowsInSection() ?? 0
    }
    
    func getData(in row: Int) -> TodoItem? {
        return delegate?.getData(in: row)
    }
}
