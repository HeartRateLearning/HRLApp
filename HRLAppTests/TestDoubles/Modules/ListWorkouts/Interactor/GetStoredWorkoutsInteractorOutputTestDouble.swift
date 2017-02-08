//
//  GetStoredWorkoutsInteractorOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 23/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class GetStoredWorkoutsInteractorOutputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var didFindWorkoutsCount = 0

    fileprivate (set) var lastFoundWorkouts = [] as [String]
}

// MARK: - GetStoredWorkoutsInteractorOutput methods

extension GetStoredWorkoutsInteractorOutputTestDouble: GetStoredWorkoutsInteractorOutput {
    func interactor(_ interactor: GetStoredWorkoutsInteractorInput,
                    didFindWorkouts workouts: [String]) {
        didFindWorkoutsCount += 1

        lastFoundWorkouts = workouts
    }
}
