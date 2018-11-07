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
    
    init(presenter: UINavigationController, singleArticle: Article) {
        self.presenter = presenter
        let singleController = SingleViewController()
        let singleViewModel = SingleViewModel(article: singleArticle)
        singleController.viewModel = singleViewModel
        controller = singleController
    }
    
    func start() {
        presenter.pushViewController(self.controller, animated: false)
    }
    
    func viewHasFinished() {
        childCoordinators.removeAll()
        parentCoordinatorDelegate?.childHasFinished(coordinator: self)
    }
    
}
