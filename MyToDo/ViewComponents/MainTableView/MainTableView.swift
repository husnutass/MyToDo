//
//  MainTableView.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 20.02.2022.
//

import UIKit

class MainTableView: BaseView {
    
    weak var delegate: HomeView?
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        return view
    }()
    
    override func setupView() {
        super.setupView()
        addSubview(tableView)
        
        tableView.expandView(to: self)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MainTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.getNumberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier) as? MainTableViewCell else { return UITableViewCell() }
        cell.setData(with: delegate?.getData(in: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        delegate?.deleteItem(at: indexPath.row)
    }
}
