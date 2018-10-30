//
//  FakeRepository.swift
//  NewsApp
//
//  Created by Valentin Šarić on 24/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift

class ArticleRepository: Interactor{
    
    var db: Realm
    
    init() {
        db = try! Realm()
    }
    
    func getResponseFromUrl() -> Observable<[Article]>{
        return getDataFromURL(link: Constants.url)
    }
    
    func getArticlesFromDb() -> [Article]{
        guard !db.isEmpty else{
            return []
        }
        let dbArticlesArray = db.objects(DbArticle.self)
        var articleArray = [Article]()
        for article in dbArticlesArray{
            articleArray.append(Article(title: article.title, image: article.urlToImage, description: article.articleDescription))
        }
        return articleArray
    }
    
    func putArticlesToDb(articles: [Article]){
        if !db.isEmpty{
            try! db.write{
            db.deleteAll()
            }
        }
        for article in articles{
            let articleDb = DbArticle()
            articleDb.title = article.title
            articleDb.urlToImage = article.urlToImage
            articleDb.articleDescription = article.description
            try! db.write {
               db.add(articleDb)
            }
        }
    }
}
