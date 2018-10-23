//
//  Interactor.swift
//  NewsApp
//
//  Created by Valentin Šarić on 23/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

protocol Interactor{
   func getDataFromURL(link: String, complition: @escaping (Bool,Data?,Error?) -> Void)
}

extension Interactor{
    
    func getDataFromURL(link: String, complition: @escaping (Bool,Data?,Error?) -> Void){
        
        let dataURL = URL(string: link)!
        
        let session = URLSession(configuration: .default)
        
        let downloadTask = session.dataTask(with: dataURL) { (data, response, error) in
            if let e = error {
                print("Error downloading data: \(e)")
            } else {
                if let res = response as? HTTPURLResponse {
                    print("Downloaded data with response code \(res.statusCode)")
                    if let downloadedData = data {
                        DispatchQueue.main.async {
                            complition(true,downloadedData,nil)
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        complition(false,nil,nil)
                    }
                }
            }
        }
        downloadTask.resume()
    }
}
