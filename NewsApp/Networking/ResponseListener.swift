//
//  ResponseListener.swift
//  NewsApp
//
//  Created by Valentin Šarić on 23/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
protocol ResponseListener{
    func onSuccess(data: Any?)
    func onFailure(error: Error)
}
