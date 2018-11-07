//
//  MainCoordinatorDelegate.swift
//  NewsApp
//
//  Created by Valentin Šarić on 06/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

protocol NextScreenCoordinatorDelegate: CoordinatorDelegate {
    func openNextScreen(article: Article)
}
