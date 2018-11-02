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
    var viewReloadData = PublishSubject<Bool>()
    
    var articleRepository = ArticleRepository()
    var data : [Article] = []
    
    func getNews() -> [Article]{
        data = articleRepository.getFilteredFavoriteArticles()
        return data
    }
    
    func removeNewsFromFavorites(index: Int){
        articleRepository.removeFromFavoriteDb(article: data[index])
        data.remove(at: index)
        viewReloadData.onNext(true)
    }
}



