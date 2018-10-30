//
//  TabBarController.swift
//  NewsApp
//
//  Created by Valentin Šarić on 30/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController{
    override func viewDidLoad() {
        let mainViewController = MainViewController()
        mainViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        //tu
        let favoriteViewController = SingleViewController(singleArticle: Article(title: "Consumption blamed for mass wildlife loss", image: "https://ichef.bbci.co.uk/news/1024/branded_news/5AE5/production/_104096232_017859289-1.jpg", description: "Exploding consumption has wiped out 60% of wildlife since 1970, conservationists say."))
        favoriteViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        let viewControllerList = [mainViewController, favoriteViewController]
        
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
}
