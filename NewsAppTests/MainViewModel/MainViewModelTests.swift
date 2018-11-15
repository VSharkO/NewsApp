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
        
        describe("Test mainViewModel initialization"){
            context("initionalized correctly"){
                it("is not nil"){
                    expect(mainViewModel).toNot(be(nil))
                }
                it("data field is filled with data correctly"){
                    mainViewModel.refreshCurrentData.onNext(true)
                    expect(mainViewModel.data.count).to(be(3))
                }
            }
        }
        
        describe("spinner logic when getting data"){
            context("while geting data"){
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
        
        describe("Test if favorites in data are set correctly"){
            context("when data has changed"){
                it("favorites in data that are in favoritesDB marked as favorites"){
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
    }
}

