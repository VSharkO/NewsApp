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
    var disposableRefresh,disposableSpinner: Disposable! // ovo isto u view
    weak var view : MainView!
    
    var timeOfLastResponse: Int32 = SYSTEM_CLOCK
    
    init(view : MainView) {
        self.view = view
        disposableSpinner = InitSpinnerLogic()
        disposableRefresh = getDataFromRepository()
        fillDisposeBag()
        self.showSpinner.onNext(true) //jer imam dva različita spinera, kada dolazim na screen prikaže se jedan,a kod pull to refresha se prikaže njegov defaultni
        refreshData(forceRefresh: true)//kada bude baza staviti na false ako je baza prazna(prvi puta se pokreće app)
    }
    
    func getNews() -> [Article]{
        return data
    }
    
    func refreshData(forceRefresh: Bool){
        forceRefresh || timeOfLastResponse * 300 < SYSTEM_CLOCK ? refresh.onNext(true) : view.reloadData();
    }
    
    func getDataFromRepository() -> Disposable{
        return refresh.flatMap{_ -> Observable<[Article]> in
            return self.articleRepository.getResponseFromUrl()
            }
            .subscribe(onNext: { [unowned self] articles in
                self.data = articles
                self.view.reloadData()
                self.showSpinner.onNext(false)
            })
    }
    
    func InitSpinnerLogic() -> Disposable{
        return showSpinner.flatMap{ isTrue -> Observable<Bool> in
            if isTrue{
                return Observable.just(true)
            }else{
                return Observable.just(false)
            }
            }
            .subscribe(onNext: { [unowned self] isTrue in
                if isTrue{
                    self.view.displayLoader()
                }else{
                    self.view.hideLoader()
                    self.view.hideSpinner()
                }
            })
    }
    
    func fillDisposeBag(){
        view.fillDisposeBag(disposables: [disposableRefresh,disposableSpinner])
    }
}



