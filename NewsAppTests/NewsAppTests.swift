//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import RxBlocking
@testable import NewsApp

class NewsAppTests: XCTestCase {
    
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    var mainViewModel: MainViewModel!
    
    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
        scheduler = TestScheduler(initialClock: 0)
        
        mainViewModel = MainViewModel()
        mainViewModel.initData().disposed(by: disposeBag)
        mainViewModel.initGetingDataFromApi().disposed(by: disposeBag)
        mainViewModel.initSpinnerLogic().disposed(by: disposeBag)
    }
    
    override func tearDown() {
        super.tearDown()
        mainViewModel = nil
    }
    
    func testIfDataCountOnStartIsNull(){
        // 1. given
        let testObserver = scheduler.createObserver(Bool.self)
        mainViewModel.showSpinner.subscribe(testObserver).disposed(by: disposeBag)
        // 2. when
        
        // 3. then
        XCTAssertEqual(mainViewModel.data.count, 0,"there is more then 0 articles in data field on start")
        
    }
    
    func testIfDataCountChangeAfterRefrashing() {
        // 1. given
        
        
        // 2. when
        mainViewModel.refreshCurrentData.onNext(true)
        
        // 3. then
        XCTAssertEqual(mainViewModel.data.count, 10, "there is no 10 articles in data field after refresh")
    }
    
    func testIfSpinerIshownOnForceRefresh() {
        // 1. given
        let showSpinnerSubscription = scheduler.createObserver(Bool.self)
        // 2. when
        mainViewModel.showSpinner.subscribe(showSpinnerSubscription).disposed(by: disposeBag)
        scheduler.start()
        
        mainViewModel.refreshCurrentData.onNext(true)
        // 3. then
        XCTAssertEqual(showSpinnerSubscription.events.first?.value.element, true , "spinner doesnt shown")
    }
    
    func testIfFavoritesAreDeclaredAsFavorites() {
        // 1. given
        var isValid = true
        var favoritesInData: [Article] = []
        var favorites: [Article]
        do {
            favorites = try mainViewModel.articleRepository.getFavoriteArticlesFromDb().toBlocking().toArray()[0]
        }catch{
            favorites = []
        }
        // 2. when
        mainViewModel.refreshCurrentData.onNext(true)
        
        for article in mainViewModel.data{
            if favorites.contains(where: { favorite -> Bool in
                favorite.title == article.title
            }){
                favoritesInData.append(article)
                isValid = article.isFavorite
            }
        }
        // 3. then
        XCTAssertEqual(isValid ,true, "some favorites in data field are not asigned as favorites")
        print(favoritesInData.count)
        print(favorites.count)
    }
    
}
