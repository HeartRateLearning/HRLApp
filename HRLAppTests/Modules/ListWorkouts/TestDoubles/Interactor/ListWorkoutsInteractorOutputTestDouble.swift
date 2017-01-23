//
//  ListWorkoutsInteractorOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class ListWorkoutsInteractorOutputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var didFindWorkoutsCount = 0

    fileprivate (set) var lastFoundWorkouts = [] as [String]
}

// MARK: - ListWorkoutsInteractorOutput methods

extension ListWorkoutsInteractorOutputTestDouble: ListWorkoutsInteractorOutput {
    func interactor(_ interactor: ListWorkoutsInteractorInput, didFind workouts: [String]) {
        didFindWorkoutsCount += 1

        lastFoundWorkouts = workouts
    }
}
