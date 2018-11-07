//
//  SingleCoordinator.swift
//  NewsApp
//
//  Created by Valentin Šarić on 07/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import UIKit

class SingleCoordinator: Coordinator, CoordinatorDelegate{
    
    var childCoordinators: [Coordinator]=[]
    var presenter: UINavigationController
    var controller: SingleViewController
    weak var parentCoordinatorDelegate: ParentCoordinatorDelegate?
    
    init(presenter: UINavigationController, article: Article) {
        self.presenter = presenter
        let singleController = SingleViewController()
        let singleViewModel = SingleViewModel(article: article)
        singleController.viewModel = singleViewModel
        controller = singleController
    }
    
    func start() {
        presenter.pushViewController(controller, animated: true)
    }
    
    func viewHasFinished() {
        childCoordinators.removeAll()
        parentCoordinatorDelegate?.childHasFinished(coordinator: self)
    }
    
}
