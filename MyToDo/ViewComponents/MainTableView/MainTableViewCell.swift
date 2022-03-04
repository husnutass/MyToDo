//
//  MainTableViewCell.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 20.02.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private var cellData: TodoItem?
    
    static var identifier: String {
        String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(contentView)
        contentView.addSubview(titleLabel)
        
        titleLabel.expandView(to: contentView, with: 20)
        
    }
    
    func setData(with data: TodoItem?) {
        cellData = data
        updateViewData()
    }
    
    private func updateViewData() {
        titleLabel.text = cellData?.text
    }
    
}
