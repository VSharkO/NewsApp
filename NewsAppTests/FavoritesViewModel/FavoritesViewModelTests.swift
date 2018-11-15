//
//  FavoritesViewModelTests.swift
//  NewsAppTests
//
//  Created by Valentin Šarić on 15/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import RxTest
import RxSwift
import RxBlocking
import Quick
import Nimble
import Cuckoo
@testable import NewsApp

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
        
        describe("Test favoritesViewModel initialization"){
            context("Initionalized correctly"){
                it("is not nil"){
                    expect(favoritesViewModel).toNot(be(nil))
                }
                it("data field is filled with favorites"){
                    favoritesViewModel.refreshData()
                    expect(favoritesViewModel.data.count).to(be(2))
                }
            }
        }
    }
}


