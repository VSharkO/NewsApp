//
//  ViewModel.swift
//  NewsApp
//
//  Created by Valentin Šarić on 30/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

class SingleViewModel : SingleViewModelProtocol{
    
    var singleArticle: Article!
    var viewSetData = PublishSubject<Article>()
    
    init(article: Article) {
        singleArticle = article
    }
    func getData(){
        viewSetData.onNext(singleArticle)
    }
}
