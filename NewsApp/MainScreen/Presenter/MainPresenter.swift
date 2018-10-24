//
//  MainPresenter.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

protocol MainPresenter{
    
    func getSingleNews(index: Int) -> Article?
    func getDataFromRepository()
    func getPictureFromRepository(forArticleAtIndex: Int, response: @escaping (Bool,UIImage?,Error?) -> Void)
    func getNumberOfItems() -> Int
}
