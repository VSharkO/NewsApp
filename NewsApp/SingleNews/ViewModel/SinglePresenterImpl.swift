//
//  SinglePresenterImpl.swift
//  NewsApp
//
//  Created by Valentin Šarić on 24/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

struct articleData{
    var viewSetPicture: String
    var viewSetTitle: String
    var viewSetDescription: String
    
    init(pictureUrl: String, title: String, description: String) {
        
    }
}

class SinglePresenterImpl : SinglePresenter, Interactor{

 
    var fakeRepository = ArticleRepository()
    var viewShowSpinner = PublishSubject<Bool>()
    
    init(singleArticle: Article) {
        viewShowSpinner.onNext(true)
        fillViewWithData(article: singleArticle)
    }
    func fillViewWithData(article: Article){
        
        viewShowSpinner.onNext(false)
    }
}
