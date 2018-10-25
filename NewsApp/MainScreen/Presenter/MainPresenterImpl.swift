//
//  MainPresenterImpl.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class MainPresenterImpl : MainPresenter{
    
    var articleRepository = ArticleRepository()
    var data : [Article] = []
    weak var view : MainView!
    var numberOfLoadedImages = 0
    
    init(view : MainView) {
        self.view = view
        getDataFromRepository()
    }
    
    func getNews() -> [Article] {
        return data
    }
    
    func getDataFromRepository(){
        view?.showSpinner()
        articleRepository.getResponseFromUrl { [weak self](success, arrayOfArticles, error) in
            guard let strongSelf = self else{
                return
            }
            if(success){
                if let articles = arrayOfArticles{
                    strongSelf.data = articles
                }
                strongSelf.view.hideSpinner()
                strongSelf.view.reloadData()
            }
        }
    }
}


