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

class ArticleRepository: Interactor,ArticleRepositoryProtocol{
    
    func getResponseFromUrl() -> Observable<[Article]>{
        return getDataFromURL(link: Constants.url)
    }
    
    func getArticlesFromDb() -> Observable<[Article]>{
        var articleArray = [Article]()
        do {
            let db = try Realm()
            guard !db.isEmpty else{
                return Observable.just([])
            }
            let dbArticlesArray = db.objects(DbArticle.self)
            
            for article in dbArticlesArray{
                var currentArticle = Article(title: article.title, image: article.urlToImage, description: article.articleDescription)
                currentArticle.isFavorite = article.isFavorite
                articleArray.append(currentArticle)
            }
        } catch let error as NSError {
            print(error)
        }
        
        return Observable.just(articleArray)
    }
    
    func putArticleToFavoriteDb(article: Article){
        do {
            let db = try Realm()
            
            let favoriteArticle = DbArticleFavorites(articleTitle: article.title, articleUrlToImage: article.urlToImage, description: article.description, articleTimeOfCreation: article.timeOfCreation, articleIsFavorite: article.isFavorite)
            guard db.objects(DbArticleFavorites.self).filter({$0.title == article.title}).first != nil else{
                try! db.write {
                    db.add(favoriteArticle)
                }
                return
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    func putArticlesToDb(articles: [Article]){
        do {
            let db = try Realm()
            var dbArticles: [DbArticle] = []
            //        var isFavorite = false
            for article in articles{
                //            if db.objects(DbArticleFavorites.self).filter({$0.title == article.title}).first != nil{
                //                isFavorite = true
                //            }
                dbArticles.append(DbArticle(articleTitle: article.title, articleUrlToImage: article.urlToImage, description: article.description, articleTimeOfCreation: article.timeOfCreation, articleIsFavorite: article.isFavorite))// isFavorite))
                //            if article.isFavorite || isFavorite{
                //                putArticleToFavoriteDb(article: article)
                //            }else{
                //                removeFromFavoriteDb(article: article)
                //            }
                //            isFavorite = false
            }
            
            try! db.write {
                db.delete(db.objects(DbArticle.self))
                db.add(dbArticles)
            }
          
        } catch let error as NSError {
            print(error)
        }
    }
    
    func getFavoriteArticlesFromDb() -> Observable<[Article]>{
        var articleArray = [Article]()
        do {
            let db = try Realm()
            guard !db.isEmpty else{
                return Observable.just([])
            }
            let dbArticlesArray = db.objects(DbArticleFavorites.self).sorted(by: {(firstNews, secondNews) -> Bool in
                return firstNews.timeOfCreation > secondNews.timeOfCreation
            })
            for article in dbArticlesArray{
                var currentArticle = Article(title: article.title, image: article.urlToImage, description: article.articleDescription)
                currentArticle.isFavorite = article.isFavorite
                articleArray.append(currentArticle)
            }
            
        } catch let error as NSError {
            print(error)
        }
        return Observable.just(articleArray)
    }
    
    func removeFromFavoriteDb(article: Article){
        do {
            let db = try Realm()
            
            if let news = db.objects(DbArticleFavorites.self).filter({$0.title == article.title}).first{
                try! db.write {
                    db.delete(news)
                }
            }
            if let dbArticle = db.objects(DbArticle.self).filter({$0.title == article.title}).first{
                try! db.write {
                    dbArticle.isFavorite = false
                }
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
}

