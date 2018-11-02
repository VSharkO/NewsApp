//
//  MainPresenter.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol MainViewModelProtocol{
    func initSpinnerLogic() -> Disposable
    func initGetingDataFromRepository() -> Disposable
    func initData() -> Disposable
    func getNews() -> [Article]
    func setNewsToFavorites(index: Int)
    func refreshData()
    
    
    var viewReloadData: PublishSubject<Bool>{get}
    var viewShowLoader: PublishSubject<Bool>{get}
    var viewShowSpinner: PublishSubject<Bool>{get}
}
