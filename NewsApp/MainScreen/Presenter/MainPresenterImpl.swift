//
//  MainPresenterImpl.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RxSwift

class MainPresenterImpl : MainPresenter{
    
    var articleRepository = ArticleRepository()
    var data : [Article] = []
    var pullToRefresh = PublishSubject<Bool>()
    weak var view : MainView!
    
    var timeOfLastResponse: Int32 = SYSTEM_CLOCK
    
    init(view : MainView) {
        self.view = view
        refreshData(forceRefresh: true) //kada bude baza staviti na false
    }
    
    func getNews() -> [Article]{
        return data
    }
    
    func refreshData(forceRefresh: Bool){
        forceRefresh ? pullToRefresh.onNext(true) : checkForRefresh()
    }
    
    private func checkForRefresh(){
        (timeOfLastResponse * 300 < SYSTEM_CLOCK) ? pullToRefresh.onNext(true) : view.reloadData(); view.hideSpinner()
    }
    
    func getDataFromRepository() -> Disposable{
        return pullToRefresh.flatMap{_ -> Observable<[Article]> in
            return self.articleRepository.getResponseFromUrl()
            }.subscribe(onNext: {articles in
                self.data = articles
                self.view.reloadData()
            })
    }
        
        
        
//        articleRepository.getResponseFromUrl { [weak self](success, arrayOfArticles, error) in
//            guard let strongSelf = self else{
//                return
//            }
//            if(success){
//                if let articles = arrayOfArticles{
//                    strongSelf.data = articles
//                    strongSelf.timeOfLastResponse = SYSTEM_CLOCK
//                }
//            }
//            strongSelf.view.hideSpinner()
//            strongSelf.view.reloadData()
//        }
//    }
   
}


