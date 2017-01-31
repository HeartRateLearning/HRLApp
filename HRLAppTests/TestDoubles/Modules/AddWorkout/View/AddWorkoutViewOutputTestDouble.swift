//
//  AddWorkoutViewOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 24/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class AddWorkoutViewOutputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var addWorkoutCount = 0

    fileprivate (set) var lastAddWorkoutIndex = -1
    fileprivate (set) var lastAddWorkoutDate = Date(timeIntervalSince1970: 0)
}

// MARK: - ListWorkoutsViewOutput methods

extension AddWorkoutViewOutputTestDouble: AddWorkoutViewOutput {
    func viewIsReady() {}

    func addWorkout(at index: Int, startingOn date: Date) {
        addWorkoutCount += 1

        lastAddWorkoutIndex = index
        lastAddWorkoutDate = date
    }
}
