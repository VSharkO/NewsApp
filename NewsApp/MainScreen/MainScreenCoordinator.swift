//
//  MainScreenCoordinator.swift
//  NewsApp
//
//  Created by Valentin Šarić on 06/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import UIKit
class MainScreenCoordinator : Coordinator, NextScreenCoordinatorDelegate, ParentCoordinatorDelegate{

    let controller: MainViewController
    var childCoordinators: [Coordinator] = []
    var presenter: UINavigationController
    
    init() {
        self.presenter = UINavigationController()
        let mainViewController = MainViewController()
        let mainViewModel = MainViewModel()
        mainViewController.viewModel = mainViewModel
        controller = mainViewController
    }
    
    func start() {
        controller.mainCoordinatorDelegate = self
        presenter.pushViewController(controller, animated: true)
    }
    
    func openNextScreen(article: Article) {
        let coordinator = SingleCoordinator(presenter: self.presenter, article: article)
        coordinator.parentCoordinatorDelegate = self
        coordinator.start()
        self.addChildCoordinator(childCoordinator: coordinator)
    }
    
    func viewHasFinished() {
        childCoordinators.removeAll()
    }
    
    func childHasFinished(coordinator: Coordinator){
        removeChildCoordinator(childCoordinator: coordinator)
    }
    
}




