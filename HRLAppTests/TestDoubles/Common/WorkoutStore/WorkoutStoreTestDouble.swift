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

    // MARK: - Public properties

    fileprivate (set) var workoutsCount = 0
}

// MARK: - WorkoutStoreProtocol methods

extension WorkoutStoreTestDouble: WorkoutStoreProtocol {
    var workouts: [String] {
        workoutsCount += 1

        return []
    }
}
