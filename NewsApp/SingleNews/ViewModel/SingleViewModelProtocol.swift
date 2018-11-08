//
//  ViewModelProtocol.swift
//  NewsApp
//
//  Created by Valentin Šarić on 30/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol SingleViewModelProtocol{
    var viewSetData: PublishSubject<Article>{get}
    func getData()
}
