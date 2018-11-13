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
  
    var articleRepository: ArticleRepositoryProtocol!
    var data : [Article] = []
    var forceRefreshFromApi = PublishSubject<Bool>()
    var showSpinner = PublishSubject<Bool>()
    var refreshCurrentData = PublishSubject<Bool>()
    weak var mainCoordinatorDelegate: SingleScreenCoordinatorDelegate?
    
    var viewReloadData = PublishSubject<Bool>()
    var viewShowLoader = PublishSubject<Bool>()
    var viewShowSpinner = PublishSubject<Bool>()
    
    
    
    func getNews() -> [Article]{
        return data
    }
    
    init(repository: ArticleRepositoryProtocol) {
        articleRepository = repository
    }
    
    func initData() -> Disposable{
        return refreshCurrentData.flatMap({_ -> Observable<[Article]> in
            self.showSpinner.onNext(true)
            return self.articleRepository.getArticlesFromDb()})
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[unowned self] articles in
                if articles.isEmpty{
                    self.forceRefreshFromApi.onNext(true)
                }else{
                    if articles[0].timeOfCreation + 300 < Date().timeIntervalSince1970{
                        self.forceRefreshFromApi.onNext(true)
                    }else{
                        self.data = articles
                        self.viewReloadData.onNext(true)
                        self.showSpinner.onNext(false)
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
    
    func initGetingDataFromApi() -> Disposable{
        return forceRefreshFromApi.flatMap({ _ -> Observable<([Article],[Article])> in
            Observable.zip(self.articleRepository.getResponseFromUrl(), self.articleRepository.getFavoriteArticlesFromDb())})
            .map{
                (articles,favorites) -> [Article] in
                var newArticles = articles
                let favoriteArticles = favorites
                if favoriteArticles.count>0{
                    for i in 0...newArticles.count-1{
                        if favoriteArticles.contains(where: {favorite -> Bool in
                            return newArticles[i].title == favorite.title
                        }){
                            newArticles[i].isFavorite = true
                        }
                    }
                }
                return newArticles
            }
//            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))    ---> zbog alamofire(on sam request odradi na offThreadu) će se svakako observati na main threadu i neće se
//            .observeOn(MainScheduler.instance)                                       započeti na offthreadu a nakon toga je skupo prelaziti na drugi thread implicitno, pa je najbolje ostati na
//                                                                                     main threadu.
            .subscribe(onNext: { [unowned self] articles in
                self.data = articles
                self.articleRepository.putArticlesToDb(articles: self.data)
                self.viewReloadData.onNext(true)
                self.viewShowLoader.onNext(false)
                self.viewShowSpinner.onNext(false)
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
            articleRepository.setIsFavoriteForArticle(article: data[index], isFavorite: false)
            viewReloadData.onNext(true)
        }else{
            data[index].isFavorite = true
            articleRepository.putArticleToFavoriteDb(article: data[index])
            articleRepository.setIsFavoriteForArticle(article: data[index], isFavorite: true)
            viewReloadData.onNext(true)
        }
    }
}



