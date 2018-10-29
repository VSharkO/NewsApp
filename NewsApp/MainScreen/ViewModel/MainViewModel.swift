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
    
    var timeOfLastResponse: Int32 = SYSTEM_CLOCK
    
    func getNews() -> [Article]{
        return data
    }
    
    func refreshData(forceRefresh: Bool){
        if forceRefresh || timeOfLastResponse * 300 < SYSTEM_CLOCK{
            refresh.onNext(true)
        }else{
            if data.isEmpty{ //Kada bude baza provjeriti dali je prazna
                refresh.onNext(true)
                showSpinner.onNext(true)
            }else{
                viewReloadData.onNext(true)
            }
        }
    }
    
    func initGetingDataFromRepository() -> Disposable{ //ovaj spinner ne moram ručno prikazivati jer je pull to refresh
        return refresh.flatMap{_ -> Observable<[Article]> in
            return self.articleRepository.getResponseFromUrl()
            }
            .subscribe(onNext: { [unowned self] articles in
                self.data = articles
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
}



