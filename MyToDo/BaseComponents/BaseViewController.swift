//
//  BaseViewController.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 19.02.2022.
//

import UIKit

class BaseViewController<V>: UIViewController {
    
    var viewModel: V!
    
    convenience init(viewModel: V) {
        self.init()
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {}

}
