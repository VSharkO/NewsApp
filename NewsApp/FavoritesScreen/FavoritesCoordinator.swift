//
//  FavoritesCoordinator.swift
//  NewsApp
//
//  Created by Valentin Šarić on 07/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import UIKit

class FavoritesCoordinator: Coordinator,CoordinatorDelegate,SingleScreenCoordinatorDelegate,ParentCoordinatorDelegate{
    
    var childCoordinators: [Coordinator] = []
    var presenter: UINavigationController
    var controller: FavoritesViewController
    
    init(presenter: UINavigationController){
        self.presenter = UINavigationController()
        let favoritesViewController = FavoritesViewController()
        let favoritesViewModel = FavoritesViewModel()
        favoritesViewController.viewModel = favoritesViewModel
        controller = favoritesViewController
    }
    
    func start() {
        presenter.pushViewController(controller, animated: true)
        controller.favoritesCoordinatorDelegate = self
        
    }
    
    func viewHasFinished() {
        childCoordinators.removeAll()
    }
    
    func openNextScreen(article: Article) {
        let coordinator = SingleCoordinator(presenter: presenter, singleArticle: article)
        coordinator.parentCoordinatorDelegate = self
        coordinator.start()
        self.addChildCoordinator(childCoordinator: coordinator)
    }
    
    func childHasFinished(coordinator: Coordinator) {
        removeChildCoordinator(childCoordinator: coordinator)
    }
}
