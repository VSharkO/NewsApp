//
//  SingleView.swift
//  NewsApp
//
//  Created by Valentin Šarić on 24/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

protocol SingleView: class{
    func setImage(image: Data)
    func setTitle(title: String)
    func setDescription(description: String)
    func hideSpinner()
    func showSpinner()
}
