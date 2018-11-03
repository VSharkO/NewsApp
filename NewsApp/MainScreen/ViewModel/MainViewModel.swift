//
//  MainPresenterImpl.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RxSwift

class MainViewModel : MainViewModelProtocol{
  
    var articleRepository = ArticleRepository()
    var data : [Article] = []
    var forceRefreshFromApi = PublishSubject<Bool>()
    var showSpinner = PublishSubject<Bool>()
    var refreshCurrentData = PublishSubject<Bool>()
    
    var viewReloadData = PublishSubject<Bool>()
    var viewShowLoader = PublishSubject<Bool>()
    var viewShowSpinner = PublishSubject<Bool>()
    
    func getNews() -> [Article]{
        return data
    }
    
    func initData() -> Disposable{
        return refreshCurrentData.flatMap({_ -> Observable<[Article]> in
            return self.articleRepository.getArticlesFromDb()
        }).subscribe(onNext: {[unowned self] articles in
            if articles.isEmpty{
                self.forceRefreshFromApi.onNext(true)
            }else{
                if articles[0].timeOfCreation + 300 < Date().timeIntervalSince1970{
                    self.showSpinner.onNext(true)
                    self.forceRefreshFromApi.onNext(true)
                }else{
                    self.data = articles
                    self.viewReloadData.onNext(true)
                }
            }
        })
    }
    
    func forceRefreshData(){
        forceRefreshFromApi.onNext(true)
    }
    
    func refreshData(){
        refreshCurrentData.onNext(true)
    }
    
    func initGetingDataFromRepository() -> Disposable{
        return forceRefreshFromApi.flatMap({ _ -> Observable<([Article],[Article])> in
            Observable.zip(self.articleRepository.getResponseFromUrl(), self.articleRepository.getFavoriteArticlesFromDb())
        }).subscribe(onNext: { [unowned self] articlesFromUrl,articlesFavorites in
            var newArticles = articlesFromUrl
            var favoriteArticles = articlesFavorites
            if articlesFavorites.count>0{
                for i in 0...newArticles.count-1{
                    for j in 0...articlesFavorites.count-1{
                        if newArticles[i].title == favoriteArticles[j].title{
                            newArticles[i].isFavorite = true
                        }
                    }
                }
            }
            self.data = newArticles
            self.viewShowLoader.onNext(false)
            self.viewShowSpinner.onNext(false)
            self.viewReloadData.onNext(true)
            })
    }
    
    func initSpinnerLogic() -> Disposable{
        return showSpinner.subscribe(onNext: { [unowned self] isTrue in
                if isTrue{
                    self.viewShowLoader.onNext(true)
                }else{
                    self.viewShowLoader.onNext(false)
                    self.viewShowSpinner.onNext(false)
                }
            })
    }
    
    func setNewsToFavorites(index: Int) {
        if(data[index].isFavorite){
            data[index].isFavorite = false
            articleRepository.removeFromFavoriteDb(article: data[index])
            articleRepository.putArticlesToDb(articles: data)
            viewReloadData.onNext(true)
        }else{
            data[index].isFavorite = true
            articleRepository.putArticleToFavoriteDb(article: data[index])
            articleRepository.putArticlesToDb(articles: data)
            viewReloadData.onNext(true)
        }
    }
    
}



