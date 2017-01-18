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

    var foundWorkoutsCount = 0
}

// MARK: - ListWorkoutsInteractorOutput methods

extension ListWorkoutsInteractorOutputTestDouble: ListWorkoutsInteractorOutput {
    func foundWorkouts(_ workouts: [String]) {
        foundWorkoutsCount += 1
    }
}
