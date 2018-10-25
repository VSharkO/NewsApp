//
//  SinglePresenterImpl.swift
//  NewsApp
//
//  Created by Valentin Šarić on 24/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

class SinglePresenterImpl : SinglePresenter, Interactor{
    
    var fakeRepository = ArticleRepository()
    weak var view: SingleView!
    
    init(view: SingleView, singleArticle: Article) {
        self.view = view
        view.showSpinner()
        fillViewWithData(article: singleArticle)
    }
    func fillViewWithData(article: Article){
        view.setImage(imageUrl: article.urlToImage)
        view.setTitle(title: article.title)
        view.setDescription(description: article.description)
        view.hideSpinner()
    }
}
