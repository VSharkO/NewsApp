//
//  TabBarCoordinator.swift
//  NewsApp
//
//  Created by Valentin Šarić on 06/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import UIKit
class TabBarCoordinator : Coordinator, CoordinatorDelegate{
    
    var presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    var controller: TabBarController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        controller = TabBarController()
        let mainCoordinator = MainScreenCoordinator()
        let favoritesCoordinator = FavoritesCoordinator()
        mainCoordinator.start()
        favoritesCoordinator.start()
        let viewControllerList = [mainCoordinator.controller, favoritesCoordinator.controller]
        mainCoordinator.controller.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        favoritesCoordinator.controller.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        controller.viewControllers = viewControllerList.map {UINavigationController(rootViewController: $0)}
    }
    
    func start() {
        presenter.pushViewController(controller, animated: true)
    }
    
    func viewHasFinished() {
        childCoordinators.removeAll()
    }

}



