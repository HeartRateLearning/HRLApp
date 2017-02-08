//
//  ListWorkoutsViewInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 17/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class ListWorkoutsViewInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var setupCount = 0

    fileprivate (set) var lastWorkouts: [String]?
}

// MARK: - ListWorkoutsViewInput methods

extension ListWorkoutsViewInputTestDouble: ListWorkoutsViewInput {
    func setup(with workouts: [String]) {
        setupCount += 1

        lastWorkouts = workouts
    }
}
