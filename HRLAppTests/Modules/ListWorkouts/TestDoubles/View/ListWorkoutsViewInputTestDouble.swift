//
//  ListWorkoutsViewInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 17/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class ListWorkoutsViewInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var setupInitialStateCount = 0
}

// MARK: - ListWorkoutsViewInput methods

extension ListWorkoutsViewInputTestDouble: ListWorkoutsViewInput {
    func setupInitialState() {
        setupInitialStateCount += 1
    }
}
