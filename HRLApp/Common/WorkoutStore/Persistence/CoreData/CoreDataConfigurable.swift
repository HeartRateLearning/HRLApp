//
//  CoreDataConfigurable.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 14/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol CoreDataConfigurable {
    typealias CompletionHandler = () -> Void

    func setup(completionHandler: @escaping CompletionHandler)
}
