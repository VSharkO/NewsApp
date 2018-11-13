//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import RxTest
import RxSwift
import RxBlocking
import Quick
import Nimble
@testable import NewsApp

class MainViewModelTests: QuickSpec {
    
    override func spec() {
        var scheduler: TestScheduler!
        var disposeBag: DisposeBag!
        var mainViewModel: MainViewModel!
        
        beforeSuite {
            disposeBag = DisposeBag()
            scheduler = TestScheduler(initialClock: 0)
            
            mainViewModel = MainViewModel(repository: ArticleRepository()) //TODO: napraviti mock za repository
            mainViewModel.initData().disposed(by: disposeBag)
            mainViewModel.initGetingDataFromApi().disposed(by: disposeBag)
            mainViewModel.initSpinnerLogic().disposed(by: disposeBag)
        }
        
        afterSuite {
            mainViewModel = nil
        }
        
        describe("data count value"){
            context("On start"){
                it("equals null"){
                    let testObserver = scheduler.createObserver(Bool.self)
                    mainViewModel.showSpinner.subscribe(testObserver).disposed(by: disposeBag)
                    expect(mainViewModel.data.count).to(be(0))
                }
            }
            context("after refreshing"){
                it("has changed"){
                    mainViewModel.refreshCurrentData.onNext(true)
                    expect(mainViewModel.data.count).to(be(10))
                }
            }
        }
        
        describe("spinner state"){
            context("on force refresh"){
                it("is shown"){
                    let showSpinnerSubscription = scheduler.createObserver(Bool.self)
                    mainViewModel.showSpinner.subscribe(showSpinnerSubscription).disposed(by: disposeBag)
                    scheduler.start()
                    mainViewModel.refreshCurrentData.onNext(true)
                    expect(showSpinnerSubscription.events.first?.value.element).to(be(true))
                }
            }
            context("after data is set"){
                it("is hiden"){
                    let showSpinnerSubscription = scheduler.createObserver(Bool.self)
                    mainViewModel.showSpinner.subscribe(showSpinnerSubscription).disposed(by: disposeBag)
                    scheduler.start()
                    mainViewModel.refreshCurrentData.onNext(true)
                    expect(showSpinnerSubscription.events.last?.value.element).to(be(false))
                }
            }
        }
        
        describe("isFavorites parameter"){
            context("in elements of data field"){
                it("is set correct"){
                    var isValid = true
                    var favoritesInData: [Article] = []
                    var favorites: [Article]
                    do {
                        favorites = try mainViewModel.articleRepository.getFavoriteArticlesFromDb().toBlocking().toArray()[0]
                    }catch{
                        favorites = []
                    }
                    mainViewModel.refreshCurrentData.onNext(true)
                    
                    for article in mainViewModel.data{
                        if favorites.contains(where: { favorite -> Bool in
                            favorite.title == article.title
                        }){
                            favoritesInData.append(article)
                            isValid = article.isFavorite
                        }
                    }
                    expect(isValid).to(be(true))
                }
            }
        }
        
        describe("spinner state"){
            context("on force refresh"){
                it("is shown"){
                    let showSpinnerSubscription = scheduler.createObserver(Bool.self)
                    mainViewModel.showSpinner.subscribe(showSpinnerSubscription).disposed(by: disposeBag)
                    scheduler.start()
                    mainViewModel.refreshCurrentData.onNext(true)
                    expect(showSpinnerSubscription.events.first?.value.element).to(be(true))
                }
            }
            context("after data is set"){
                it("is hiden"){
                    let showSpinnerSubscription = scheduler.createObserver(Bool.self)
                    mainViewModel.showSpinner.subscribe(showSpinnerSubscription).disposed(by: disposeBag)
                    scheduler.start()
                    mainViewModel.refreshCurrentData.onNext(true)
                    expect(showSpinnerSubscription.events.last?.value.element).to(be(false))
                }
            }
        }
    }
}
