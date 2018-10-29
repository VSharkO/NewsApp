//
//  MainView.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol MainView: class{
    func reloadData()
    func displayLoader()
    func hideSpinner()
    func hideLoader()
}
