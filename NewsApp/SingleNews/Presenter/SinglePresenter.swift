//
//  SinglePresenter.swift
//  NewsApp
//
//  Created by Valentin Šarić on 24/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

protocol SinglePresenter{
    func getSingleNewsFromRepository(index: Int)
    func getPictureFromUrl(url: String, response: @escaping (Bool,Any?,Error?) -> Void)
}
