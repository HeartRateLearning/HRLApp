//
//  SetupRouterInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class SetupRouterInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var presentWorkoutListCount = 0
}

// MARK: - SetupRouterInput methods

extension SetupRouterInputTestDouble: SetupRouterInput {
    func presentWorkoutList() {
        presentWorkoutListCount += 1
    }
}
