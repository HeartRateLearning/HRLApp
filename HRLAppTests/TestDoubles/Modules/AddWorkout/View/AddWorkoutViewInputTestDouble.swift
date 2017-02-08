//
//  AddWorkoutViewInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 24/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class AddWorkoutViewInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var setupCount = 0

    fileprivate (set) var lastWorkouts: [String]?
}

// MARK: - AddWorkoutViewInput methods

extension AddWorkoutViewInputTestDouble: AddWorkoutViewInput {
    func setup(with workouts: [String]) {
        setupCount += 1

        lastWorkouts = workouts
    }
}
