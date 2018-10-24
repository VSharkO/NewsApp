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
            fakeRepository.getPictureFromUrl(url: articles[forArticleAtIndex].urlToImage) { (success,data,error) in
                if(success){
                    if let anyAsData = UIImage(data: data as! Data){ //ovaj UIImage? ok ili da bude data pa da view datu prebaci u UIImage?
                        response(true,anyAsData,nil)
                    }
                }else{
                    response(false,nil,nil)
                }
            }
        }
    }
    
    func getDataFromRepository(){
        fakeRepository.getResponseFromUrl { [weak self](success, arrayOfArticles, error) in
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
    
    func getNumberOfItems() -> Int {
        if let count = data?.count{
            return count
        }else{
            return 0
        }
    }
    
}


