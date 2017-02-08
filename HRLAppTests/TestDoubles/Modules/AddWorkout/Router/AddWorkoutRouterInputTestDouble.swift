//
//  AddWorkoutRouterInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 26/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class AddWorkoutRouterInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var presentWorkoutListCount = 0
}

// MARK: - AddWorkoutRouterInput methods

extension AddWorkoutRouterInputTestDouble: AddWorkoutRouterInput {
    func presentWorkoutList() {
        presentWorkoutListCount += 1
    }
}
