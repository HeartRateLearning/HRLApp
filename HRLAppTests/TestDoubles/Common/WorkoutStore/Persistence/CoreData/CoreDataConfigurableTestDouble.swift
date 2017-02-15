//
//  CoreDataConfigurableTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class CoreDataConfigurableTestDouble {

    // MARK: - Public properties

    fileprivate (set) var setupCount = 0
}

// MARK: - CoreDataConfigurable methods

extension CoreDataConfigurableTestDouble: CoreDataConfigurable {
    func setup(completionHandler: @escaping CoreDataConfigurable.CompletionHandler) {
        setupCount += 1

        completionHandler()
    }
}
