//
//  MainPresenterImpl.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

class MainPresenterImpl : MainPresenter{

    var articleRepository = ArticleRepository()
    var data : [Article] = []
    weak var view : MainView?
    var numberOfLoadedImages = 0
    
    init(view : MainView) {
        self.view = view
        getDataFromRepository()
    }
    
    func getNews() -> [Article] {
        return data
    }
    
    func getPictureFromRepository(forArticleAtIndex: Int, response: @escaping (Bool,Data?,Error?) -> Void){
            articleRepository.getPictureFromUrl(url: data[forArticleAtIndex].urlToImage) { [weak self](success,data,error) in
                guard let strongSelf = self else{
                    return
                }
                if(success){
                    if let anyAsData = data as? Data{ //ovaj UIImage? ok ili da bude data pa da view datu prebaci u UIImage?
                        response(true,anyAsData,nil)
                        
                        if(!strongSelf.checkIfAllImagesAreLoaded()){
                            strongSelf.numberOfLoadedImages += 1
                        }else{
                            strongSelf.view?.hideSpinner()
                        }
                    }
                }else{
                    response(false,nil,nil)
                    strongSelf.view?.hideSpinner()
                }
            }
    }
    
    func checkIfAllImagesAreLoaded() -> Bool{
        if numberOfLoadedImages == data.count-1{
                return true
            }else{
                return false
            }
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
                strongSelf.view?.reloadData()
            }
        }
    }
}


