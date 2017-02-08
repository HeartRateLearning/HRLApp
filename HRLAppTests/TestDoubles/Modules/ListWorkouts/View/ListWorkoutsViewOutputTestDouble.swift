//
//  ListWorkoutsViewOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 17/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class ListWorkoutsViewOutputTestDouble {
    
    // MARK: - Public properties

    fileprivate (set) var addCount = 0
    fileprivate (set) var didSelectWorkoutCount = 0

    fileprivate (set) var lastSelectedWorkoutIndex = -1
}

// MARK: - ListWorkoutsViewOutput methods

extension ListWorkoutsViewOutputTestDouble: ListWorkoutsViewOutput {
    func viewIsReady() {}

    func add() {
        addCount += 1
    }

    func didSelectWorkout(at index: Int) {
        didSelectWorkoutCount += 1

        lastSelectedWorkoutIndex = index
    }
}
