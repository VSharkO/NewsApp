//
//  FakeRepository.swift
//  NewsApp
//
//  Created by Valentin Šarić on 24/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class ArticleRepository: Interactor{
 
    func getResponseFromUrl(response: @escaping (Bool,[Article]?,Error?) -> Void){
        getDataFromURL(link: Constants.url) { (success, data, error) in
            if success{
                if let responseData = data{
                    do{
                        let decoder = try JSONDecoder().decode(Response.self, from: responseData)
                        response(true,decoder.articles,nil)
                    }catch{
                        print("something went wrong with downloading Articles data")
                    }
                }
            }
        }
    }
    
    func getPictureFromUrl(url: String, response: @escaping (Bool,UIImage,Error?) -> Void){
        getDataFromURL(link: url) { (success, data, error) in
            if success{
                if let image = UIImage(data: data!){
                    response(true,image,error)
                }
                
            }
        }
    }
}
