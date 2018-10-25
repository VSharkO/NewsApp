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
    
    func getPictureFromUrl(url: String, response: @escaping (Bool,Any?,Error?) -> Void){
        getDataFromURL(link: url) { [weak self](success, data, error) in
            guard let strongSelf = self else{
                return
            }
            if success{
                strongSelf.view.hideSpinner()
                response(true,data,error)
            }else{
                strongSelf.view.hideSpinner()
            }
        }
    }
    
    func fillViewWithData(article: Article){
        
        getPictureFromUrl(url: article.urlToImage) { [weak self](success, pictureData, error) in
            guard let strongSelf = self else{
                return
            }
            if success{
                if let imageData = pictureData as? Data{
                    strongSelf.view.setImage(image: imageData)
                }
            }
        }

        view.setTitle(title: article.title)
        view.setDescription(description: article.description)
        view.hideSpinner()
    }
}
