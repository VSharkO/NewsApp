// MARK: - Mocks generated from file: NewsApp/ArticleRepository/ArticleRepositoryProtocol.swift at 2018-11-15 12:00:18 +0000

//
//  ArticleRepositoryProtocol.swift
//  NewsApp
//
//  Created by Valentin Šarić on 02/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
import Cuckoo
@testable import NewsApp

import Foundation
import RxSwift

class MockArticleRepositoryProtocol: ArticleRepositoryProtocol, Cuckoo.ProtocolMock {
    typealias MocksType = ArticleRepositoryProtocol
    typealias Stubbing = __StubbingProxy_ArticleRepositoryProtocol
    typealias Verification = __VerificationProxy_ArticleRepositoryProtocol

    private var __defaultImplStub: ArticleRepositoryProtocol?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: ArticleRepositoryProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "getResponseFromUrl", "returnSignature": " -> Observable<[Article]>", "fullyQualifiedName": "getResponseFromUrl() -> Observable<[Article]>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<[Article]>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getResponseFromUrl()  -> Observable<[Article]> {
        
            return cuckoo_manager.call("getResponseFromUrl() -> Observable<[Article]>",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getResponseFromUrl())
        
    }
    
    // ["name": "getArticlesFromDb", "returnSignature": " -> Observable<[Article]>", "fullyQualifiedName": "getArticlesFromDb() -> Observable<[Article]>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<[Article]>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getArticlesFromDb()  -> Observable<[Article]> {
        
            return cuckoo_manager.call("getArticlesFromDb() -> Observable<[Article]>",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getArticlesFromDb())
        
    }
    
    // ["name": "getFavoriteArticlesFromDb", "returnSignature": " -> Observable<[Article]>", "fullyQualifiedName": "getFavoriteArticlesFromDb() -> Observable<[Article]>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<[Article]>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getFavoriteArticlesFromDb()  -> Observable<[Article]> {
        
            return cuckoo_manager.call("getFavoriteArticlesFromDb() -> Observable<[Article]>",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getFavoriteArticlesFromDb())
        
    }
    
    // ["name": "removeFromFavoriteDb", "returnSignature": "", "fullyQualifiedName": "removeFromFavoriteDb(article: Article)", "parameterSignature": "article: Article", "parameterSignatureWithoutNames": "article: Article", "inputTypes": "Article", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "article", "call": "article: article", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("article"), name: "article", type: "Article", range: CountableRange(437..<453), nameRange: CountableRange(437..<444))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "article", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func removeFromFavoriteDb(article: Article)  {
        
            return cuckoo_manager.call("removeFromFavoriteDb(article: Article)",
                parameters: (article),
                escapingParameters: (article),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.removeFromFavoriteDb(article: article))
        
    }
    
    // ["name": "setIsFavoriteForArticle", "returnSignature": "", "fullyQualifiedName": "setIsFavoriteForArticle(article: Article, isFavorite: Bool)", "parameterSignature": "article: Article, isFavorite: Bool", "parameterSignatureWithoutNames": "article: Article, isFavorite: Bool", "inputTypes": "Article, Bool", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "article, isFavorite", "call": "article: article, isFavorite: isFavorite", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("article"), name: "article", type: "Article", range: CountableRange(488..<504), nameRange: CountableRange(488..<495)), CuckooGeneratorFramework.MethodParameter(label: Optional("isFavorite"), name: "isFavorite", type: "Bool", range: CountableRange(506..<522), nameRange: CountableRange(506..<516))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "article, isFavorite", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func setIsFavoriteForArticle(article: Article, isFavorite: Bool)  {
        
            return cuckoo_manager.call("setIsFavoriteForArticle(article: Article, isFavorite: Bool)",
                parameters: (article, isFavorite),
                escapingParameters: (article, isFavorite),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.setIsFavoriteForArticle(article: article, isFavorite: isFavorite))
        
    }
    
    // ["name": "putArticlesToDb", "returnSignature": "", "fullyQualifiedName": "putArticlesToDb(articles: [Article])", "parameterSignature": "articles: [Article]", "parameterSignatureWithoutNames": "articles: [Article]", "inputTypes": "[Article]", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "articles", "call": "articles: articles", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("articles"), name: "articles", type: "[Article]", range: CountableRange(549..<568), nameRange: CountableRange(549..<557))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "articles", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func putArticlesToDb(articles: [Article])  {
        
            return cuckoo_manager.call("putArticlesToDb(articles: [Article])",
                parameters: (articles),
                escapingParameters: (articles),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.putArticlesToDb(articles: articles))
        
    }
    
    // ["name": "putArticleToFavoriteDb", "returnSignature": "", "fullyQualifiedName": "putArticleToFavoriteDb(article: Article)", "parameterSignature": "article: Article", "parameterSignatureWithoutNames": "article: Article", "inputTypes": "Article", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "article", "call": "article: article", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("article"), name: "article", type: "Article", range: CountableRange(602..<618), nameRange: CountableRange(602..<609))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "article", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func putArticleToFavoriteDb(article: Article)  {
        
            return cuckoo_manager.call("putArticleToFavoriteDb(article: Article)",
                parameters: (article),
                escapingParameters: (article),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.putArticleToFavoriteDb(article: article))
        
    }
    

	struct __StubbingProxy_ArticleRepositoryProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getResponseFromUrl() -> Cuckoo.ProtocolStubFunction<(), Observable<[Article]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepositoryProtocol.self, method: "getResponseFromUrl() -> Observable<[Article]>", parameterMatchers: matchers))
	    }
	    
	    func getArticlesFromDb() -> Cuckoo.ProtocolStubFunction<(), Observable<[Article]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepositoryProtocol.self, method: "getArticlesFromDb() -> Observable<[Article]>", parameterMatchers: matchers))
	    }
	    
	    func getFavoriteArticlesFromDb() -> Cuckoo.ProtocolStubFunction<(), Observable<[Article]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepositoryProtocol.self, method: "getFavoriteArticlesFromDb() -> Observable<[Article]>", parameterMatchers: matchers))
	    }
	    
	    func removeFromFavoriteDb<M1: Cuckoo.Matchable>(article: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Article)> where M1.MatchedType == Article {
	        let matchers: [Cuckoo.ParameterMatcher<(Article)>] = [wrap(matchable: article) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepositoryProtocol.self, method: "removeFromFavoriteDb(article: Article)", parameterMatchers: matchers))
	    }
	    
	    func setIsFavoriteForArticle<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(article: M1, isFavorite: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Article, Bool)> where M1.MatchedType == Article, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Article, Bool)>] = [wrap(matchable: article) { $0.0 }, wrap(matchable: isFavorite) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepositoryProtocol.self, method: "setIsFavoriteForArticle(article: Article, isFavorite: Bool)", parameterMatchers: matchers))
	    }
	    
	    func putArticlesToDb<M1: Cuckoo.Matchable>(articles: M1) -> Cuckoo.ProtocolStubNoReturnFunction<([Article])> where M1.MatchedType == [Article] {
	        let matchers: [Cuckoo.ParameterMatcher<([Article])>] = [wrap(matchable: articles) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepositoryProtocol.self, method: "putArticlesToDb(articles: [Article])", parameterMatchers: matchers))
	    }
	    
	    func putArticleToFavoriteDb<M1: Cuckoo.Matchable>(article: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Article)> where M1.MatchedType == Article {
	        let matchers: [Cuckoo.ParameterMatcher<(Article)>] = [wrap(matchable: article) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockArticleRepositoryProtocol.self, method: "putArticleToFavoriteDb(article: Article)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_ArticleRepositoryProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
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
	    func getFavoriteArticlesFromDb() -> Cuckoo.__DoNotUse<Observable<[Article]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getFavoriteArticlesFromDb() -> Observable<[Article]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeFromFavoriteDb<M1: Cuckoo.Matchable>(article: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Article {
	        let matchers: [Cuckoo.ParameterMatcher<(Article)>] = [wrap(matchable: article) { $0 }]
	        return cuckoo_manager.verify("removeFromFavoriteDb(article: Article)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func setIsFavoriteForArticle<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(article: M1, isFavorite: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Article, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Article, Bool)>] = [wrap(matchable: article) { $0.0 }, wrap(matchable: isFavorite) { $0.1 }]
	        return cuckoo_manager.verify("setIsFavoriteForArticle(article: Article, isFavorite: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func putArticlesToDb<M1: Cuckoo.Matchable>(articles: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Article] {
	        let matchers: [Cuckoo.ParameterMatcher<([Article])>] = [wrap(matchable: articles) { $0 }]
	        return cuckoo_manager.verify("putArticlesToDb(articles: [Article])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func putArticleToFavoriteDb<M1: Cuckoo.Matchable>(article: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Article {
	        let matchers: [Cuckoo.ParameterMatcher<(Article)>] = [wrap(matchable: article) { $0 }]
	        return cuckoo_manager.verify("putArticleToFavoriteDb(article: Article)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class ArticleRepositoryProtocolStub: ArticleRepositoryProtocol {
    

    

    
     func getResponseFromUrl()  -> Observable<[Article]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Article]>.self)
    }
    
     func getArticlesFromDb()  -> Observable<[Article]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Article]>.self)
    }
    
     func getFavoriteArticlesFromDb()  -> Observable<[Article]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Article]>.self)
    }
    
     func removeFromFavoriteDb(article: Article)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func setIsFavoriteForArticle(article: Article, isFavorite: Bool)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func putArticlesToDb(articles: [Article])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func putArticleToFavoriteDb(article: Article)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

