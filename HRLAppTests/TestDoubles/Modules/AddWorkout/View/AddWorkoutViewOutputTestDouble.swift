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

    fileprivate (set) var numberOfWorkoutsCount = 0
    fileprivate (set) var workoutAtIndexCount = 0
    fileprivate (set) var addWorkoutCount = 0

    fileprivate (set) var lastWorkoutIndex = -1
    fileprivate (set) var lastAddWorkoutIndex = -1

    var numberOfWorkoutsResult = 0
}

// MARK: - ListWorkoutsViewOutput methods

extension AddWorkoutViewOutputTestDouble: AddWorkoutViewOutput {
    func viewIsReady() {}

    func numberOfWorkouts() -> Int {
        numberOfWorkoutsCount += 1

        return numberOfWorkoutsResult
    }

    func workout(at index: Int) -> String {
        workoutAtIndexCount += 1
        lastWorkoutIndex = index

        return ""
    }

    func addWorkout(at index: Int) {
        addWorkoutCount += 1

        lastAddWorkoutIndex = index
    }
}
