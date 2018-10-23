//
//  MainPresenterImpl.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class MainPresenterImpl : MainPresenter,Interactor{
    
    var fakeResponse: Data? = nil
    var fakeRepository : [Article] = []
    
    weak var view : MainView?
    init(view : MainView) {
        self.view = view
    }
    
    func getSingleNewsFromRepository(index: Int) -> Article {
        return fakeRepository[index]
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
                        self.fakeRepository = decoder.articles
                        self.view?.reloadData()
                        print (self.fakeRepository)
                    }catch{
                        print("nevalja nešto")
                    }
                }
            }
        }
    }
    
    func getNumberOfItems() -> Int {
        return fakeRepository.count
    }
    
}


