//
//  Interactor.swift
//  NewsApp
//
//  Created by Valentin Šarić on 23/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import Alamofire

protocol Interactor{
    func getDataFromURL(link: String, complition: @escaping (Bool,Data?,Error?) -> Void)
}

extension Interactor{
    func getDataFromURL(link: String, complition: @escaping (Bool,Data?,Error?) -> Void){
        Alamofire.request(link).responseJSON { response in
            complition(true, response.data, nil)
        }
    }
}
