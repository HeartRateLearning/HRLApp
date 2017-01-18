//
//  ListWorkoutsRouterTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Public body

class ListWorkoutsRouterTestDouble {

    // MARK: - Public properties

    fileprivate (set) var presentAddWorkoutCount = 0
}

// MARK: - ListWorkoutsRouterInput methods

extension ListWorkoutsRouterTestDouble: ListWorkoutsRouterInput {
    func presentAddWorkout() {
        presentAddWorkoutCount += 1
    }
}
