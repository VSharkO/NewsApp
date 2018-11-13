//
//  ArticleRepositoryProtocol.swift
//  NewsApp
//
//  Created by Valentin Šarić on 02/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol ArticleRepositoryProtocol{
    func getResponseFromUrl() -> Observable<[Article]>
    func getArticlesFromDb() -> Observable<[Article]>
    func getFavoriteArticlesFromDb() -> Observable<[Article]>
    func removeFromFavoriteDb(article: Article)
    func setIsFavoriteForArticle(article: Article, isFavorite: Bool)
    func putArticlesToDb(articles: [Article])
    func putArticleToFavoriteDb(article: Article)
}
