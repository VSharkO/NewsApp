//
//  AppCoordinator.swift
//  NewsApp
//
//  Created by Valentin Šarić on 06/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(presneter: UINavigationController){
        self.presenter = presneter
    }
    
    func start() {
        let tabBarCoordinator = TabBarCoordinator(presenter: presenter)
        tabBarCoordinator.start()
        self.addChildCoordinator(childCoordinator: tabBarCoordinator)
    }
}