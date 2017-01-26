//
//  StoreWorkoutInteractorInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 26/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class StoreWorkoutInteractorInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var executeCount = 0
    fileprivate (set) var lastWorkoutIndex = 0
}

// MARK: - StoreWorkoutInteractorInput methods

extension StoreWorkoutInteractorInputTestDouble: StoreWorkoutInteractorInput {
    func execute(withWorkoutIndex index: Int) {
        executeCount += 1
        lastWorkoutIndex = index
    }
}
