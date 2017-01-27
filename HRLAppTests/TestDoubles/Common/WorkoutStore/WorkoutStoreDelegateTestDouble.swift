//
//  WorkoutStoreDelegateTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 27/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class WorkoutStoreDelegateTestDouble {

    // MARK: - Public properties
    fileprivate (set) var didAppendWorkoutAtIndexCount = 0
    fileprivate (set) var lastAppendedWorkoutIndex = -1
}

// MARK: - WorkoutStoreDelegate methods

extension WorkoutStoreDelegateTestDouble: WorkoutStoreDelegate {
    func workoutStore(_ store: WorkoutStoreProtocol, didAppendWorkoutAtIndex index: Int) {
        didAppendWorkoutAtIndexCount += 1

        lastAppendedWorkoutIndex = index
    }
}
