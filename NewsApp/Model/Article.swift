//
//  News.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RealmSwift

struct Article: Codable {
    let title : String
    let urlToImage : String
    let description : String
    var timeOfCreation : Double = 0
    var isFavorite : Bool = false
    
    init(title: String, image: String, description : String) {
        self.title = title
        self.urlToImage = image
        self.description = description
        timeOfCreation = Date().timeIntervalSince1970
    }
    
    init(title: String, image: String, description : String, isFavorite : Bool) {
        self.title = title
        self.urlToImage = image
        self.description = description
        self.isFavorite = isFavorite
        timeOfCreation = Date().timeIntervalSince1970
    }
    
    private enum CodingKeys: String, CodingKey {
        case title
        case urlToImage
        case description
    }
}

struct Response: Codable {
    let status: String
    let source: String
    let sortBy: String
    let articles : [Article]
}

class DbArticle: Object{
    @objc dynamic var title : String = ""
    @objc dynamic var urlToImage: String = ""
    @objc dynamic var articleDescription: String = ""
    @objc dynamic var timeOfCreation: Double = 0
    @objc dynamic var isFavorite: Bool = false
    
    convenience init(articleTitle: String, articleUrlToImage: String, description: String, articleTimeOfCreation: Double, articleIsFavorite: Bool) {
        self.init()
        title = articleTitle
        urlToImage = articleUrlToImage
        articleDescription = description
        timeOfCreation = Date().timeIntervalSince1970
        isFavorite = articleIsFavorite
    }
}

class DbArticleFavorites: DbArticle{

}
