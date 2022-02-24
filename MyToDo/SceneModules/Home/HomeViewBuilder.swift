//
//  HomeViewBuilder.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 18.02.2022.
//

import UIKit

class HomeViewBuilder: ViewBuilderProtocol {
    
    static func build() -> UIViewController {
        let viewModel = HomeViewModel(firestoreManager: FirestoreManager())
        return HomeViewController(viewModel: viewModel)
    }
    
}
