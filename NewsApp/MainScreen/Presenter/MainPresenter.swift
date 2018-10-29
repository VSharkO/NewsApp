//
//  MainPresenter.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RxSwift

protocol MainPresenter{
    func refreshData(forceRefresh: Bool)
    func getNews() -> [Article]
    func initSpinnerLogic() -> Disposable
    func initGetingDataFromRepository() -> Disposable
}
