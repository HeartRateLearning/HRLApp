//
//  AddWorkoutViewInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 24/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class AddWorkoutViewInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var setupInitialStateCount = 0
}

// MARK: - AddWorkoutViewInput methods

extension AddWorkoutViewInputTestDouble: AddWorkoutViewInput {
    func setupInitialState() {
        setupInitialStateCount += 1
    }
}
