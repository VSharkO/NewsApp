// MARK: - Mocks generated from file: NewsApp/ArticleRepository/ArticleRepository.swift at 2018-11-14 08:18:17 +0000

//
//  FakeRepository.swift
//  NewsApp
//
//  Created by Valentin Šarić on 24/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
import Cuckoo
@testable import NewsApp

import RealmSwift
import RxSwift
import UIKit

class MockArticleRepository: ArticleRepository, Cuckoo.ClassMock {
    typealias MocksType = ArticleRepository
    typealias Stubbing = __StubbingProxy_ArticleRepository
    typealias Verification = __VerificationProxy_ArticleRepository

    private var __defaultImplStub: ArticleRepository?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    func enableDefaultImplementation(_ stub: ArticleRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "setIsFavoriteForArticle", "returnSignature": "", "fullyQualifiedName": "setIsFavoriteForArticle(article: Article, isFavorite: Bool)", "parameterSignature": "article: Article, isFavorite: Bool", "parameterSignatureWithoutNames": "article: Article, isFavorite: Bool", "inputTypes": "Article, Bool", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "article, isFavorite", "call": "article: article, isFavorite: isFavorite", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("article"), name: "article", type: "Article", range: CountableRange(303..<319), nameRange: CountableRange(303..<310)), CuckooGeneratorFramework.MethodParameter(label: Optional("isFavorite"), name: "isFavorite", type: "Bool", range: CountableRange(321..<337), nameRange: CountableRange(321..<331))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "article, isFavorite", "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func setIsFavoriteForArticle(article: Article, isFavorite: Bool)  {
        
            return cuckoo_manager.call("setIsFavoriteForArticle(article: Article, isFavorite: Bool)",
                parameters: (article, isFavorite),
                escapingParameters: (article, isFavorite),
                superclassCall:
                    
                    super.setIsFavoriteForArticle(article: article, isFavorite: isFavorite)
                    ,
                defaultCall: __defaultImplStub!.setIsFavoriteForArticle(article: article, isFavorite: isFavorite))
        
    }
    
    // ["name": "getResponseFromUrl", "returnSignature": " -> Observable<[Article]>", "fullyQualifiedName": "getResponseFromUrl() -> Observable<[Article]>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<[Article]>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ClassStubFunction"]
     override func getResponseFromUrl()  -> Observable<[Article]> {
        
            return cuckoo_manager.call("getResponseFromUrl() -> Observable<[Article]>",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    super.getResponseFromUrl()
                    ,
                defaultCall: __defaultImplStub!.getResponseFromUrl())
        
    }
    
    // ["name": "getArticlesFromDb", "returnSignature": " -> Observable<[Article]>", "fullyQualifiedName": "getArticlesFromDb() -> Observable<[Article]>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<[Article]>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ClassStubFunction"]
     override func getArticlesFromDb()  -> Observable<[Article]> {
        
            return cuckoo_manager.call("getArticlesFromDb() -> Observable<[Article]>",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    super.getArticlesFromDb()
                    ,
                defaultCall: __defaultImplStub!.getArticlesFromDb())
        
    }
    
    // ["name": "putArticleToFavoriteDb", "returnSignature": "", "fullyQualifiedName": "putArticleToFavoriteDb(article: Article)", "parameterSignature": "article: Article", "parameterSignatureWithoutNames": "article: Article", "inputTypes": "Article", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "article", "call": "article: article", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("article"), name: "article", type: "Article", range: CountableRange(1746..<1762), nameRange: CountableRange(1746..<1753))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "article", "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func putArticleToFavoriteDb(article: Article)  {
        
            return cuckoo_manager.call("putArticleToFavoriteDb(article: Article)",
                parameters: (article),
                escapingParameters: (article),
                superclassCall:
                    
                    super.putArticleToFavoriteDb(article: article)
                    ,
                defaultCall: __defaultImplStub!.putArticleToFavoriteDb(article: article))
        
    }
    
    // ["name": "putArticlesToDb", "returnSignature": "", "fullyQualifiedName": "putArticlesToDb(articles: [Article])", "parameterSignature": "articles: [Article]", "parameterSignatureWithoutNames": "articles: [Article]", "inputTypes": "[Article]", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "articles", "call": "articles: articles", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("articles"), name: "articles", type: "[Article]", range: CountableRange(2415..<2434), nameRange: CountableRange(2415..<2423))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "articles", "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func putArticlesToDb(articles: [Article])  {
        
            return cuckoo_manager.call("putArticlesToDb(articles: [Article])",
                parameters: (articles),
                escapingParameters: (articles),
                superclassCall:
                    
                    super.putArticlesToDb(articles: articles)
                    ,
                defaultCall: __defaultImplStub!.putArticlesToDb(articles: articles))
        
    }
    
    // ["name": "getFavoriteArticlesFromDb", "returnSignature": " -> Observable<[Article]>", "fullyQualifiedName": "getFavoriteArticlesFromDb() -> Observable<[Article]>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<[Article]>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ClassStubFunction"]
     override func getFavoriteArticlesFromDb()  -> Observable<[Article]> {
        
            return cuckoo_manager.call("getFavoriteArticlesFromDb() -> Observable<[Article]>",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    super.getFavoriteArticlesFromDb()
                    ,
                defaultCall: __defaultImplStub!.getFavoriteArticlesFromDb())
        
    }
    
    // ["name": "removeFromFavoriteDb", "returnSignature": "", "fullyQualifiedName": "removeFromFavoriteDb(article: Article)", "parameterSignature": "article: Article", "parameterSignatureWithoutNames": "article: Article", "inputTypes": "Article", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "article", "call": "article: article", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("article"), name: "article", type: "Article", range: CountableRange(4106..<4122), nameRange: CountableRange(4106..<4113))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "article", "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func removeFromFavoriteDb(article: Article)  {
        
            return cuckoo_manager.call("removeFromFavoriteDb(article: Article)",
                parameters: (article),
                escapingParameters: (article),
                superclassCall:
                    
                    super.removeFromFavoriteDb(article: article)
                    ,
                defaultCall: __defaultImplStub!.removeFromFavoriteDb(article: article))
        
    }
    

	struct __StubbingProxy_ArticleRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func setIsFavoriteForArticle<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(article: M1, isFavorite: M2) -> Cuckoo.ClassStubNoReturnFunction<(Article, Bool)> where M1.MatchedType == Article, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Article, Bool)>] = [wrap(matchable: article) { $0.0 }, wrap(matchable: isFavorite) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepository.self, method: "setIsFavoriteForArticle(article: Article, isFavorite: Bool)", parameterMatchers: matchers))
	    }
	    
	    func getResponseFromUrl() -> Cuckoo.ClassStubFunction<(), Observable<[Article]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepository.self, method: "getResponseFromUrl() -> Observable<[Article]>", parameterMatchers: matchers))
	    }
	    
	    func getArticlesFromDb() -> Cuckoo.ClassStubFunction<(), Observable<[Article]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepository.self, method: "getArticlesFromDb() -> Observable<[Article]>", parameterMatchers: matchers))
	    }
	    
	    func putArticleToFavoriteDb<M1: Cuckoo.Matchable>(article: M1) -> Cuckoo.ClassStubNoReturnFunction<(Article)> where M1.MatchedType == Article {
	        let matchers: [Cuckoo.ParameterMatcher<(Article)>] = [wrap(matchable: article) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepository.self, method: "putArticleToFavoriteDb(article: Article)", parameterMatchers: matchers))
	    }
	    
	    func putArticlesToDb<M1: Cuckoo.Matchable>(articles: M1) -> Cuckoo.ClassStubNoReturnFunction<([Article])> where M1.MatchedType == [Article] {
	        let matchers: [Cuckoo.ParameterMatcher<([Article])>] = [wrap(matchable: articles) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepository.self, method: "putArticlesToDb(articles: [Article])", parameterMatchers: matchers))
	    }
	    
	    func getFavoriteArticlesFromDb() -> Cuckoo.ClassStubFunction<(), Observable<[Article]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepository.self, method: "getFavoriteArticlesFromDb() -> Observable<[Article]>", parameterMatchers: matchers))
	    }
	    
	    func removeFromFavoriteDb<M1: Cuckoo.Matchable>(article: M1) -> Cuckoo.ClassStubNoReturnFunction<(Article)> where M1.MatchedType == Article {
	        let matchers: [Cuckoo.ParameterMatcher<(Article)>] = [wrap(matchable: article) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepository.self, method: "removeFromFavoriteDb(article: Article)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_ArticleRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func setIsFavoriteForArticle<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(article: M1, isFavorite: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Article, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Article, Bool)>] = [wrap(matchable: article) { $0.0 }, wrap(matchable: isFavorite) { $0.1 }]
	        return cuckoo_manager.verify("setIsFavoriteForArticle(article: Article, isFavorite: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getResponseFromUrl() -> Cuckoo.__DoNotUse<Observable<[Article]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getResponseFromUrl() -> Observable<[Article]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getArticlesFromDb() -> Cuckoo.__DoNotUse<Observable<[Article]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getArticlesFromDb() -> Observable<[Article]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func putArticleToFavoriteDb<M1: Cuckoo.Matchable>(article: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Article {
	        let matchers: [Cuckoo.ParameterMatcher<(Article)>] = [wrap(matchable: article) { $0 }]
	        return cuckoo_manager.verify("putArticleToFavoriteDb(article: Article)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func putArticlesToDb<M1: Cuckoo.Matchable>(articles: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Article] {
	        let matchers: [Cuckoo.ParameterMatcher<([Article])>] = [wrap(matchable: articles) { $0 }]
	        return cuckoo_manager.verify("putArticlesToDb(articles: [Article])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getFavoriteArticlesFromDb() -> Cuckoo.__DoNotUse<Observable<[Article]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getFavoriteArticlesFromDb() -> Observable<[Article]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeFromFavoriteDb<M1: Cuckoo.Matchable>(article: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Article {
	        let matchers: [Cuckoo.ParameterMatcher<(Article)>] = [wrap(matchable: article) { $0 }]
	        return cuckoo_manager.verify("removeFromFavoriteDb(article: Article)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class ArticleRepositoryStub: ArticleRepository {
    

    

    
     override func setIsFavoriteForArticle(article: Article, isFavorite: Bool)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func getResponseFromUrl()  -> Observable<[Article]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Article]>.self)
    }
    
     override func getArticlesFromDb()  -> Observable<[Article]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Article]>.self)
    }
    
     override func putArticleToFavoriteDb(article: Article)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func putArticlesToDb(articles: [Article])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func getFavoriteArticlesFromDb()  -> Observable<[Article]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Article]>.self)
    }
    
     override func removeFromFavoriteDb(article: Article)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

