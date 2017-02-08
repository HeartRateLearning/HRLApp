//
//  ListWorkoutDatesViewInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 31/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class ListWorkoutDatesViewInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var setupCount = 0

    fileprivate (set) var lastDates: [Date]?
}

// MARK: - ListWorkoutDatesViewInput methods

extension ListWorkoutDatesViewInputTestDouble: ListWorkoutDatesViewInput {
    func setup(with dates: [Date]) {
        setupCount += 1

        lastDates = dates
    }
}
