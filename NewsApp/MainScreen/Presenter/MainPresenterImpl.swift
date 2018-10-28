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
    var refresh = PublishSubject<Bool>()
    var showSpinner = PublishSubject<Bool>()
    var disposableRefresh,disposableSpinner: Disposable!
    weak var view : MainView!
    
    var timeOfLastResponse: Int32 = SYSTEM_CLOCK
    
    init(view : MainView) {
        self.view = view
        disposableRefresh = getDataFromRepository()
        refreshData(forceRefresh: true) //kada bude baza staviti na false ako je baza prazna(prvi puta se pokreće app)
        disposableSpinner = spinnerLogic()
        showSpinner.onNext(true)
    }
    
    func getNews() -> [Article]{
        return data
    }
    
    func refreshData(forceRefresh: Bool){
        forceRefresh || timeOfLastResponse * 300 < SYSTEM_CLOCK ? refresh.onNext(true) : view.reloadData(); showSpinner.onNext(false)
    }
    
    func getDataFromRepository() -> Disposable{
        return refresh.flatMap{_ -> Observable<[Article]> in
            return self.articleRepository.getResponseFromUrl()}
            .subscribe(onNext: { [weak self] articles in
                guard let strongSelf = self else{return}
                strongSelf.data = articles
                strongSelf.view.reloadData()
                strongSelf.showSpinner.onNext(false)
            })
    }
    
    func spinnerLogic() -> Disposable{
        return showSpinner.flatMap{ isTrue -> Observable<Bool> in
            if isTrue{
                    return Observable.just(true)
                }else{
                    return Observable.just(false)
                }
            }
            .subscribe(onNext: { [weak self] isTrue in
                guard let strongSelf = self else{return}
                isTrue ? strongSelf.view.showSpinner() : strongSelf.view.hideSpinner()
            })
    }
    
    //u kojem trenutku disposat disposable-e?
            
}



