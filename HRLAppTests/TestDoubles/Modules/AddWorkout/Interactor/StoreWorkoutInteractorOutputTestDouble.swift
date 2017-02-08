//
//  StoreWorkoutInteractorOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 25/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class StoreWorkoutInteractorOutputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var didStoreWorkoutCount = 0
    fileprivate (set) var didFailToStoreWorkoutWithIndexCount = 0

    fileprivate (set) var lastStoredWorkout = ""
    fileprivate (set) var lastFailedWorkoutIndex = -1

}

// MARK: - StoreWorkoutInteractorOutput methods

extension StoreWorkoutInteractorOutputTestDouble: StoreWorkoutInteractorOutput {
    func interactor(_ interactor: StoreWorkoutInteractorInput, didStoreWorkout workout: String) {
        didStoreWorkoutCount += 1

        lastStoredWorkout = workout
    }

    func interactor(_ interactor: StoreWorkoutInteractorInput,
                    didFailToStoreWorkoutWithIndex index: Int) {
        didFailToStoreWorkoutWithIndexCount += 1

        lastFailedWorkoutIndex = index
    }
}
