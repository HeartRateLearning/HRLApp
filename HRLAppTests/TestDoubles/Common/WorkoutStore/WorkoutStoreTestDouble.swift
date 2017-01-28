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
    fileprivate (set) var dateCountCount = 0
    fileprivate (set) var dateAtIndexCount = 0
    fileprivate (set) var appendDateCount = 0

    fileprivate (set) var lastWorkoutIndex = -1
    fileprivate (set) var lastAppendedWorkout = Workout.other
    fileprivate (set) var lastDateCountWorkoutIndex = -1
    fileprivate (set) var lastDateIndex = -1
    fileprivate (set) var lastDateWorkoutIndex = -1
    fileprivate (set) var lastAppendedDate = Date(timeIntervalSince1970: 0)
    fileprivate (set) var lastAppendedDateWorkoutIndex = -1

    var workoutCountResult = 0
    var workoutAtIndexResult: Workout?
    var dateCountResult: Int?
    var dateAtIndexResult: Date?
}

// MARK: - WorkoutStoreProtocol methods

extension WorkoutStoreTestDouble: WorkoutStoreProtocol {
    func workoutCount() -> Int {
        workoutCountCount += 1

        return workoutCountResult
    }

    func workout(at index: Int) -> Workout? {
        workoutAtIndexCount += 1

        lastWorkoutIndex = index

        return workoutAtIndexResult

    }

    func appendWorkout(_ workout: Workout) {
        appendWorkoutCount += 1

        lastAppendedWorkout = workout
    }

    func dateCount(forWorkoutAt workoutIndex: Int) -> Int? {
        dateCountCount += 1

        lastDateCountWorkoutIndex = workoutIndex

        return dateCountResult
    }

    func date(at index: Int, forWorkoutAt workoutIndex: Int) -> Date? {
        dateAtIndexCount += 1

        lastDateIndex = index
        lastDateWorkoutIndex = workoutIndex

        return dateAtIndexResult
    }

    func appendDate(_ date: Date, toWorkoutAt workoutIndex: Int) {
        appendDateCount += 1

        lastAppendedDate = date
        lastAppendedDateWorkoutIndex = workoutIndex
    }
}
