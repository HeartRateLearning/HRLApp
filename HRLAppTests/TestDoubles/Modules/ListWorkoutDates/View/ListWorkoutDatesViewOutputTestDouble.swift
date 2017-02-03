//
//  ListWorkoutDatesViewOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class ListWorkoutDatesViewOutputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var didSelectDateCount = 0

    fileprivate (set) var lastSelectedDateIndex = -1
}

// MARK: - ListWorkoutDatesViewOutput methods

extension ListWorkoutDatesViewOutputTestDouble: ListWorkoutDatesViewOutput {
    func didSelectDate(at index: Int) {
        didSelectDateCount += 1

        lastSelectedDateIndex = index
    }
}
