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

        getPictureFromUrl(url: article.urlToImage) { [weak self](success, pictureData, error) in
            guard let strongSelf = self else{
                return
            }
            if success{
                //MARK zapeo tu, stari način ne radi jer je view ubio prezenter a bio je još jedan poziv na prezenter umjesto da se ova logika za slike odmah pozvala ovdije
                if let imageData = pictureData as? Data{//tu data ili UIImage?
                    strongSelf.view?.setImage(image: imageData)
                }
            }
        }

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
