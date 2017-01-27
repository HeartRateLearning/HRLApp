//
//  WorkoutStoreTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class WorkoutStoreTestDouble {

    // MARK: - WorkoutStoreProtocol properties

    weak var delegate: WorkoutStoreDelegate?

    // MARK: - Public properties

    fileprivate (set) var workoutCountCount = 0
    fileprivate (set) var workoutAtIndexCount = 0
    fileprivate (set) var appendWorkoutCount = 0

    fileprivate (set) var lastWorkoutIndex = -1
    fileprivate (set) var lastAppendedWorkout = Workout.other

    var workoutCountResult = 0
    var workoutAtIndexResult = Workout.other
}

// MARK: - WorkoutStoreProtocol methods

extension WorkoutStoreTestDouble: WorkoutStoreProtocol {
    func workoutCount() -> Int {
        workoutCountCount += 1

        return workoutCountResult
    }

    func workout(at index: Int) -> Workout {
        workoutAtIndexCount += 1

        lastWorkoutIndex = index

        return workoutAtIndexResult

    }

    func appendWorkout(_ workout: Workout) {
        appendWorkoutCount += 1

        lastAppendedWorkout = workout
    }
}
