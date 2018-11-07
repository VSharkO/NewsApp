//
//  MainScreenCoordinator.swift
//  NewsApp
//
//  Created by Valentin Šarić on 06/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import UIKit
class MainScreenCoordinator : Coordinator, SingleScreenCoordinatorDelegate, ParentCoordinatorDelegate{

    let controller: MainViewController
    var childCoordinators: [Coordinator] = []
    var presenter: UINavigationController
    
    init(presenter: UINavigationController){
        self.presenter = UINavigationController()
        let mainViewController = MainViewController()
        let mainViewModel = MainViewModel()
        mainViewController.viewModel = mainViewModel
        controller = mainViewController
    }
  
    func start() {
        presenter.pushViewController(controller, animated: true)
        controller.mainCoordinatorDelegate = self
    }
    
    func openNextScreen(article: Article) {
        let coordinator = SingleCoordinator(presenter: presenter, singleArticle: article)
        coordinator.parentCoordinatorDelegate = self
        self.addChildCoordinator(childCoordinator: coordinator)
        coordinator.start()
    }
    
    func viewHasFinished() {
        childCoordinators.removeAll()
    }
    
    func childHasFinished(coordinator: Coordinator){
        removeChildCoordinator(childCoordinator: coordinator)
    }
    
}




