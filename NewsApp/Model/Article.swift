//
//  News.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

struct Article: Codable {
    let title : String
    let urlToImage : String
    let description : String
    
    init(title: String, image: String, description : String) {
        self.title = title
        self.urlToImage = image
        self.description = description
    }
}

struct Response: Codable {
    let status: String
    let source: String
    let sortBy: String
    let articles : [Article]
}
