//
//  SinglePresenterImpl.swift
//  NewsApp
//
//  Created by Valentin Šarić on 24/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

class SinglePresenterImpl : SinglePresenter, Interactor{
 
    var fakeRepository = FakeRepository()
    weak var view: SingleView? = nil
    var data : [Article]? = nil
    var index : Int? = nil
    
    init(view: SingleView, index: Int?) {
        self.view = view
        self.index = index
        if data == nil{
            getDataFromRepository()
        }
        view.showSpinner()
    }
    
    func getPictureFromUrl(url: String, response: @escaping (Bool,Any?,Error?) -> Void){
        getDataFromURL(link: url) { [weak self](success, data, error) in
            guard let strongSelf = self else{
                return
            }
            if success{
                strongSelf.view?.hideSpinner()
                response(true,data,error)
                
            }else{
                strongSelf.view?.hideSpinner()
            }
        }
    }
    
    func fillViewWithData(index: Int){
        guard let article = data?[index] else{
            return
        }
        view?.setImage(imageURL: article.urlToImage)
        view?.setTitle(title: article.title)
        view?.setDescription(description: article.description)
    }
    
    func getDataFromRepository(){
        self.data = FakeDatabase.database
        if let index = self.index{
            fillViewWithData(index: index)
        }
    }
    
//    func getDataFromRepository(){
//            fakeRepository.getResponseFromUrl { [weak self](success, arrayOfArticles, error) in
//                guard let strongSelf = self else{
//                    return
//                }
//                if(success){
//                    if let articles = arrayOfArticles{
//                        strongSelf.data = articles
//                        if let index = strongSelf.index{
//                            strongSelf.fillViewWithData(index: index)
//                        }
//                    }
//                }
//            }
//    }
    
    
    
}
