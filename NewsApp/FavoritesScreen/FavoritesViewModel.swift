//
//  FavoritesViewModel.swift
//  NewsApp
//
//  Created by Valentin Šarić on 31/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RxSwift

class FavoritesViewModel : FavoritesViewModelProtocol{
    
    var articleRepository = ArticleRepository()
    var data : [Article] = []
    
    func getNews() -> [Article]{
        data = articleRepository.getFilteredFavoriteArticles()
        return data
    }
}



