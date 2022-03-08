//
//  LoadingIndicatorViewController.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 8.03.2022.
//

import UIKit

class LoadingIndicatorViewController: UIViewController {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.4)
        return view
    }()
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAnimating()
    }
    
    private func configureView() {
        view.addSubview(containerView)
        containerView.addSubview(indicatorView)
        
        containerView.expandView(to: view)
        indicatorView.centerView(to: containerView)
    }
    
    private func startAnimating() {
        indicatorView.startAnimating()
    }
    
    func stopAnimating() {
        view.removeFromSuperview()
        indicatorView.stopAnimating()
    }
}
