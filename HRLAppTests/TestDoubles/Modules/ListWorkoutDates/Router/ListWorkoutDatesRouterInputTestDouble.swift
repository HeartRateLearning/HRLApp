//
//  ListWorkoutDatesRouterInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class ListWorkoutDatesRouterInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var presentHeartRatesCount = 0

    fileprivate (set) var lastPresentHeartRatesWorkoutIndex = -1
    fileprivate (set) var lastPresentHeartRatesDateIndex = -1
    
}

// MARK: - ListWorkoutDatesRouterInput methods

extension ListWorkoutDatesRouterInputTestDouble: ListWorkoutDatesRouterInput {
    func presentHeartRates(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) {
        presentHeartRatesCount += 1

        lastPresentHeartRatesWorkoutIndex = workoutIndex
        lastPresentHeartRatesDateIndex = dateIndex
    }
}
