//
//  MainPresenterImpl.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class MainPresenterImpl : MainPresenter{

    var fakeRepository = FakeRepository()
    var data : [Article]? = []
    weak var view : MainView?
    var numberOfLoadedImages = 0
    
    init(view : MainView) {
        self.view = view
        getDataFromRepository()
        
    }
    
    func getSingleNews(index: Int) -> Article? {
        if let articles = data?[index]{
            return articles
        }else{
            getDataFromRepository()
            return nil
        }
    }
    
    func getPictureFromRepository(forArticleAtIndex: Int, response: @escaping (Bool,UIImage?,Error?) -> Void){
        if let articles = data{
            fakeRepository.getPictureFromUrl(url: articles[forArticleAtIndex].urlToImage) { [weak self](success,data,error) in
                guard let strongSelf = self else{
                    return
                }
                if(success){
                    if let anyAsData = UIImage(data: data as! Data){ //ovaj UIImage? ok ili da bude data pa da view datu prebaci u UIImage?
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
    }
    
    func checkIfAllImagesAreLoaded() -> Bool{
        if let dataCount = data?.count{
            if numberOfLoadedImages == dataCount-1{
                return true
            }else{
                return false
            }
        }
        return false
    }
    
    func getDataFromRepository(){
        view?.showSpinner()
        fakeRepository.getResponseFromUrl { [weak self](success, arrayOfArticles, error) in
            guard let strongSelf = self else{
                return
            }
            if(success){
                if let articles = arrayOfArticles{
                    strongSelf.data = articles
                    FakeDatabase.database = articles
                }
                strongSelf.view?.reloadData()
            }
        }
    }
    
    func getNumberOfItems() -> Int {
        if let count = data?.count{
            return count
        }else{
            return 0
        }
    }
    
}


