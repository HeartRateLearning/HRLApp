//
//  GetAllWorkoutsInteractorOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 24/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class GetAllWorkoutsInteractorOutputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var didFindWorkoutsCount = 0

    fileprivate (set) var lastFoundWorkouts = [] as [String]
}

// MARK: - GetConfiguredWorkoutsInteractorOutput methods

extension GetAllWorkoutsInteractorOutputTestDouble: GetAllWorkoutsInteractorOutput {
    func interactor(_ interactor: GetAllWorkoutsInteractorInput,
                    didFindWorkouts workouts: [String]) {
        didFindWorkoutsCount += 1

        lastFoundWorkouts = workouts
    }
}
