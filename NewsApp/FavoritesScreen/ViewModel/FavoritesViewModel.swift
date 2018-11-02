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
    var refresh = PublishSubject<Bool>()
    var articleRepository : ArticleRepositoryProtocol
    var data : [Article] = []
    
    init() {
        articleRepository = ArticleRepository()
        refresh.onNext(true)
    }
    
    func getNews() -> [Article]{
        return data
    }
    
    func initGetingDataFromRepository() -> Disposable{
        return refresh.flatMap{_ -> Observable<[Article]> in
            return self.articleRepository.getFavoriteArticlesFromDb()
            }.subscribe(onNext: {[unowned self] articles in
                self.data = articles
                self.viewReloadData.onNext(true)
            })
    }
    
    func refreshData(){
        refresh.onNext(true)
    }
    
    func removeNewsFromFavorites(index: Int){
        articleRepository.removeFromFavoriteDb(article: data[index])
        data.remove(at: index)
        refresh.onNext(true)
    }
}



