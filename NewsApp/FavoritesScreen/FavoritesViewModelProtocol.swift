//
//  FavoritesViewModelProtocol.swift
//  NewsApp
//
//  Created by Valentin Šarić on 31/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol FavoritesViewModelProtocol{
    func getNews() -> [Article]
    func removeNewsFromFavorites(index: Int)
    
    var viewReloadData: PublishSubject<Bool>{get}
}
