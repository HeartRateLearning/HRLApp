//
//  WorkoutWriterTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 19/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class WorkoutWriterTestDouble {

    // MARK: - Public properties

    fileprivate (set) var saveWorkoutCount = 0

    fileprivate (set) var lastSaveWorkoutWorkout: Workout?
    fileprivate (set) var lastSaveWorkoutStartDate: Date?
    fileprivate (set) var lastSaveWorkoutEndDate: Date?

    var saveWorkoutResult = false
}

// MARK: - WorkoutWriterProtocol methods

extension WorkoutWriterTestDouble: WorkoutWriterProtocol {
    func saveWorkout(_ workout: Workout,
                     startingAt start: Date,
                     endingAt end: Date,
                     completionHandler: @escaping WorkoutWriterProtocol.CompletionHandler) {
        saveWorkoutCount += 1

        lastSaveWorkoutWorkout = workout
        lastSaveWorkoutStartDate = start
        lastSaveWorkoutEndDate = end

        completionHandler(saveWorkoutResult)
    }
}
