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
import Cuckoo
@testable import NewsApp

class MainViewModelTests: QuickSpec {
    
    override func spec() {
        var scheduler: TestScheduler!
        var disposeBag: DisposeBag!
        var mainViewModel: MainViewModel!
        let mockRepository = MockArticleRepositoryProtocol()
        
        beforeSuite {
            disposeBag = DisposeBag()
            scheduler = TestScheduler(initialClock: 0)

            mainViewModel = MainViewModel(repository: mockRepository)
            mainViewModel.initData().disposed(by: disposeBag)
            mainViewModel.initGetingDataFromApi().disposed(by: disposeBag)
            mainViewModel.initSpinnerLogic().disposed(by: disposeBag)
            
            stub(mockRepository) { mock in
                when(mock.getArticlesFromDb()).thenReturn(Observable.just([Article.init(title: "ROKI", image: "Rokeri", description: "najjace", isFavorite: true),Article.init(title: "siki", image: "wiki", description: "oki"),Article.init(title: "ROKI", image: "Rokeri", description: "najjace", isFavorite: true)]))
            }
            
            stub(mockRepository) { mock in
                when(mock.getFavoriteArticlesFromDb()).thenReturn(Observable.just([Article.init(title: "ROKI", image: "Rokeri", description: "najjace", isFavorite: true),Article.init(title: "ROKI", image: "Rokeri", description: "najjace", isFavorite: true)]))
            }
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
                    expect(mainViewModel.data.count).to(be(3))
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
                            isValid = article.isFavorite
                            break
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

class FavoritesViewModelTests: QuickSpec {
    
    override func spec() {
        var disposeBag: DisposeBag!
        var favoritesViewModel: FavoritesViewModel!
        let mockRepository = MockArticleRepositoryProtocol()
        
        beforeSuite {
            disposeBag = DisposeBag()
            favoritesViewModel = FavoritesViewModel(repository: mockRepository)
            favoritesViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
            
            stub(mockRepository) { mock in
                when(mock.getFavoriteArticlesFromDb()).thenReturn(Observable.just([Article.init(title: "ROKI", image: "Rokeri", description: "najjace", isFavorite: true),Article.init(title: "ROKI", image: "Rokeri", description: "najjace", isFavorite: true)]))
            }
        }
        
        afterSuite {
            favoritesViewModel = nil
        }
        
        describe("favoritesViewModel created"){
            context("data"){
                it("is null"){
                    expect(favoritesViewModel.data.count).to(be(0))
                }
            }
        }
        
        describe("favoritesViewModel refresh data"){
            it("refreshing"){
                favoritesViewModel.refreshData()
                expect(favoritesViewModel.data.count).to(be(2))
            }
        }
    }
}


