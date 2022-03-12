//
//  MainTableViewCell.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 20.02.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    private var cellData: TodoItem?
    
    static var identifier: String {
        String(describing: self)
    }
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(contentView)
        contentView.addSubview(mainStackView)
        
        mainStackView.expandView(to: contentView, with: 20)
    }
    
    func setData(with data: TodoItem?) {
        cellData = data
        updateViewData()
    }
    
    private func updateViewData() {
        titleLabel.text = cellData?.title
        descriptionLabel.text = cellData?.todoListDescription
    }
    
}
