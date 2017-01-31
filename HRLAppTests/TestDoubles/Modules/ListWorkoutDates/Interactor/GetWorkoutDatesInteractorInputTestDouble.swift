//
//  GetWorkoutDatesInteractorInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 31/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class GetWorkoutDatesInteractorInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var executeCount = 0

    fileprivate (set) var lastWorkoutIndex = -1
}

// MARK: - GetWorkoutDatesInteractorInput methods

extension GetWorkoutDatesInteractorInputTestDouble: GetWorkoutDatesInteractorInput {
    func execute(withWorkoutIndex index: Int) {
        executeCount += 1

        lastWorkoutIndex = index
    }
}
