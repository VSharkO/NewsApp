//
//  SinglePresenterImpl.swift
//  NewsApp
//
//  Created by Valentin Šarić on 24/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

class SingleViewModel : SingleViewModelProtocol{
    var fakeRepository = ArticleRepository()
    var viewFillWithData = PublishSubject<Article>() // ovako ili praviti zasebne subjecte za naslov,descript i slike
    
    init(singleArticle: Article) {
        viewFillWithData.onNext(singleArticle)
    }
}
