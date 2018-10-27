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
    var disposable: Disposable!
    weak var view : MainView!
    
    var timeOfLastResponse: Int32 = SYSTEM_CLOCK
    
    init(view : MainView) {
        self.view = view
        view.showSpinner()
        disposable = getDataFromRepository()
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
            }.subscribe(onNext: { [weak self] articles in
                guard let strongSelf = self else{return}
                strongSelf.data = articles
                strongSelf.view.reloadData()
                strongSelf.view.hideSpinner() // za spinere isto logika sa rx-om
            })
    }
}


