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
    var refresh = PublishSubject<Bool>()
    var showSpinner = PublishSubject<Bool>()
    
    var viewReloadData = PublishSubject<Bool>()
    var viewShowLoader = PublishSubject<Bool>()
    var viewShowSpinner = PublishSubject<Bool>()
    
    func getNews() -> [Article]{
        data = articleRepository.getArticlesFromDb()
        return data
    }
    
    func refreshData(forceRefresh: Bool){
        if forceRefresh || articleRepository.getArticlesFromDb().isEmpty{
            if !forceRefresh{
                showSpinner.onNext(true)
            }
            refresh.onNext(true)
        }else{
            if articleRepository.getArticlesFromDb()[0].timeOfCreation / 300 < Date().timeIntervalSince1970{ //ako je podatak iz baze stariji od 5min
                refresh.onNext(true)
                showSpinner.onNext(true)
            }else{
                data = articleRepository.getArticlesFromDb()
                viewReloadData.onNext(true)
            }
        }
    }
    
    func initGetingDataFromRepository() -> Disposable{
        return refresh.flatMap{_ -> Observable<[Article]> in
            return self.articleRepository.getResponseFromUrl()
            }
            .subscribe(onNext: { [unowned self] articles in
                self.articleRepository.putArticlesToDb(articles: articles)
                self.data = self.articleRepository.getArticlesFromDb()
                self.viewReloadData.onNext(true)
                self.showSpinner.onNext(false)
            })
    }
    
    func initSpinnerLogic() -> Disposable{
        return showSpinner.flatMap{ isTrue -> Observable<Bool> in
            if isTrue{
                return Observable.just(true)
            }else{
                return Observable.just(false)
            }
            }
            .subscribe(onNext: { [unowned self] isTrue in
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



