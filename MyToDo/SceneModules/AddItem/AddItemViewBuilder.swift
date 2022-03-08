//
//  AddItemViewBuilder.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 4.03.2022.
//

import UIKit

class AddItemViewBuilder: ViewBuilderProtocol {
    static func build() -> UIViewController {
        let viewModel = AddItemViewModel()
        let viewController = AddItemViewController(viewModel: viewModel)
        return UINavigationController(rootViewController: viewController)
    }
}
