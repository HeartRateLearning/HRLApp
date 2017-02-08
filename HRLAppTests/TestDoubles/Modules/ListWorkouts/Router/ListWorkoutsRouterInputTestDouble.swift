//
//  ListWorkoutsRouterInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 24/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class ListWorkoutsRouterInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var presentAddWorkoutCount = 0
    fileprivate (set) var presentDataListCount = 0

    fileprivate (set) var lastDataListWorkoutIndex = -1
}

// MARK: - ListWorkoutsRouterInput methods

extension ListWorkoutsRouterInputTestDouble: ListWorkoutsRouterInput {
    func presentAddWorkout() {
        presentAddWorkoutCount += 1
    }

    func presentDateList(forWorkoutAt index: Int) {
        presentDataListCount += 1

        lastDataListWorkoutIndex = index
    }
}
