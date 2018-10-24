//
//  SinglePresenterImpl.swift
//  NewsApp
//
//  Created by Valentin Šarić on 24/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

class SinglePresenterImpl : SinglePresenter, Interactor{
    
    weak var view: SingleView? = nil
    var fakeRepository : Article? = nil
    
    init(view: SingleView) {
        self.view = view
    }
    
    func getSingleNewsFromRepository(index: Int) {
        self.fakeRepository = FakeRepository.articles[index]
        fillViewWithData()
    }
    
    func getPictureFromUrl(url: String, response: @escaping (Bool,Any?,Error?) -> Void){
        //Interactor protocol function -- pitanje
        getDataFromURL(link: url) { (success, data, error) in
            if success{
                response(true,data,error)
            }
        }
    }
    
    func fillViewWithData(){
        guard let article = fakeRepository else{
            print("Cannot fill singleView with nil value of fakeRepository")
            return
        }
        view?.setImage(imageURL: article.urlToImage)
        view?.setTitle(title: article.title)
        view?.setDescription(description: article.description)
    }
    
}
