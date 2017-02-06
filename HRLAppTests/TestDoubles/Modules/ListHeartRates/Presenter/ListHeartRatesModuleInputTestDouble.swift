//
//   .swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class ListHeartRatesModuleInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var configureCount = 0

    fileprivate (set) var lastWorkoutIndex = -1
    fileprivate (set) var lastDateIndex = -1
}

// MARK: - ListHeartRatesModuleInput methods

extension ListHeartRatesModuleInputTestDouble: ListHeartRatesModuleInput {
    func configure(withWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) {
        configureCount += 1

        lastWorkoutIndex = workoutIndex
        lastDateIndex = dateIndex
    }
}

// MARK: - ListHeartRatesViewOutput methods

extension ListHeartRatesModuleInputTestDouble: ListHeartRatesViewOutput {
    func save(workingOuts: [Bool]) {}
}
