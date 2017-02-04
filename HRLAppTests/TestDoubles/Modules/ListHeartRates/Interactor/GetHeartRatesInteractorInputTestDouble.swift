//
//  GetHeartRatesInteractorInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 04/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class GetHeartRatesInteractorInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var executeCount = 0

    fileprivate (set) var lastWorkoutIndex = -1
    fileprivate (set) var lastDateIndex = -1
}

// MARK: - GetHeartRatesInteractorInput methods

extension GetHeartRatesInteractorInputTestDouble: GetHeartRatesInteractorInput {
    func execute(withWorkoutIndex workoutIndex: Int, dateIndex: Int) {
        executeCount += 1

        lastWorkoutIndex = workoutIndex
        lastDateIndex = dateIndex
    }
}
