//
//  MainPresenterImpl.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

class MainPresenterImpl : MainPresenter,Interactor{
    
    var fakeResponse: Data? = nil
//    var fakeRepository : [Article] = []
    
    weak var view : MainView?
    init(view : MainView) {
        self.view = view
    }
    
    func getSingleNewsFromRepository(index: Int) -> Article {
        return FakeRepository.articles[index]
    }
    
    func getPictureFromUrl(url: String, response: @escaping (Bool,Any?,Error?) -> Void){
        //Interactor protocol function -- pitanje
        getDataFromURL(link: url) { (success, data, error) in
            if success{
                response(true,data,error)
            }
        }
    }
  
    func getResponseFromUrl(){
        getDataFromURL(link: Constants.url) { (success, data, error) in
            if success{
                if let responseData = data{
                    do{
                        let decoder = try JSONDecoder().decode(Response.self, from: responseData)
                        FakeRepository.articles = decoder.articles
                        self.view?.reloadData()
                    }catch{
                        print("something went wrong with downloading Articles data")
                    }
                }
            }
        }
    }
    
    func getNumberOfItems() -> Int {
        return FakeRepository.articles.count
    }
    
}


