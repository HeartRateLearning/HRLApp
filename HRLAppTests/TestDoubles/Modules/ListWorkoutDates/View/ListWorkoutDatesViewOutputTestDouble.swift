//
//  ListWorkoutDatesViewOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class ListWorkoutDatesViewOutputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var numberOfDatesCount = 0
    fileprivate (set) var dateAtIndexCount = 0

    fileprivate (set) var lastDateIndex = -1

    var numberOfDatesResult = -1
}

// MARK: - ListWorkoutDatesViewOutput methods

extension ListWorkoutDatesViewOutputTestDouble: ListWorkoutDatesViewOutput {
    func viewIsReady() {}

    func numberOfDates() -> Int {
        numberOfDatesCount += 1

        return numberOfDatesResult
    }

    func date(at index: Int) -> Date {
        dateAtIndexCount += 1

        lastDateIndex = index

        return Date()
    }
}
