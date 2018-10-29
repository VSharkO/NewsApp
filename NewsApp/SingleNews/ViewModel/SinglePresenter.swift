//
//  SinglePresenter.swift
//  NewsApp
//
//  Created by Valentin Šarić on 24/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol SinglePresenter{
    var viewShowSpinner: PublishSubject<Bool>{get}
    var viewSetPicture: PublishSubject<String>{get}
    var viewSetTitle: PublishSubject<String>{get}
    var viewSetDescription: PublishSubject<String>{get}
}
