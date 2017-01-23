//
//  GetConfiguredWorkoutsInteractorOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 23/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class GetConfiguredWorkoutsInteractorOutputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var didFindWorkoutsCount = 0

    fileprivate (set) var lastFoundWorkouts = [] as [String]
}

// MARK: - GetConfiguredWorkoutsInteractorOutput methods

extension GetConfiguredWorkoutsInteractorOutputTestDouble: GetConfiguredWorkoutsInteractorOutput {
    func interactor(_ interactor: GetConfiguredWorkoutsInteractorInput,
                    didFind workouts: [String]) {
        didFindWorkoutsCount += 1

        lastFoundWorkouts = workouts
    }
}
