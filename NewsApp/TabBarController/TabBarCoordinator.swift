//
//  TabBarCoordinator.swift
//  NewsApp
//
//  Created by Valentin Šarić on 06/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import UIKit
class TabBarCoordinator :Coordinator{
    var presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    var controller: UITabBarController
    var mainCoordinator: MainScreenCoordinator!
    var favoritesCoordinator: FavoritesCoordinator!
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        presenter.isNavigationBarHidden = true
        controller = UITabBarController()
        controller.navigationItem.title = "Factory"
        
        mainCoordinator = MainScreenCoordinator(presenter: UINavigationController())
        favoritesCoordinator = FavoritesCoordinator(presenter: UINavigationController())
        
        mainCoordinator.presenter.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        mainCoordinator.presenter.navigationItem.title = "Articles"
        mainCoordinator.presenter.isNavigationBarHidden = false
        favoritesCoordinator.presenter.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        favoritesCoordinator.presenter.navigationItem.title = "Favorites"
        
        self.controller.setViewControllers([mainCoordinator.presenter,favoritesCoordinator.presenter],animated: false)
    }
    
    func start() {
        mainCoordinator.start()
        favoritesCoordinator.start()
        
       
        
        
        
        presenter.pushViewController(controller, animated: true)
        
    }
    
    func viewHasFinished() {
        childCoordinators.removeAll()
    }

}



