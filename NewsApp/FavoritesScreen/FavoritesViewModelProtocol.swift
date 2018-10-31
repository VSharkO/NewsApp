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
    func refreshData(forceRefresh: Bool)
    func getNews() -> [Article]
    func initSpinnerLogic() -> Disposable
    func setNewsToFavorites(index: Int)
    
    var viewReloadData: PublishSubject<Bool>{get}
    var viewShowLoader: PublishSubject<Bool>{get}
    var viewShowSpinner: PublishSubject<Bool>{get}
}
