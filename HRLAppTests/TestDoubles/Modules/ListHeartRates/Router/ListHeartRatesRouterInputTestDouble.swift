//
//  ListHeartRatesRouterInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 07/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class ListHeartRatesRouterInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var presentWorkoutDateListCount = 0
}

// MARK: - ListHeartRatesRouterInput methods

extension ListHeartRatesRouterInputTestDouble: ListHeartRatesRouterInput {
    func presentWorkoutDateList() {
        presentWorkoutDateListCount += 1
    }
}
