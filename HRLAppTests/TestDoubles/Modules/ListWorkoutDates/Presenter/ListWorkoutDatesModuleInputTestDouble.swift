//
//  ListWorkoutDatesModuleInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class ListWorkoutDatesModuleInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var configureCount = 0

    fileprivate (set) var lastWorkoutIndex = -1
}

// MARK: - ListWorkoutDatesModuleInput methods

extension ListWorkoutDatesModuleInputTestDouble: ListWorkoutDatesModuleInput {
    func configure(withWorkoutAt index: Int) {
        configureCount += 1

        lastWorkoutIndex = index
    }
}

// MARK: - ListWorkoutDatesViewOutput methods

extension ListWorkoutDatesModuleInputTestDouble: ListWorkoutDatesViewOutput {
    func viewIsReady() {}

    func numberOfDates() -> Int {
        return 0
    }

    func date(at index: Int) -> Date {
        return Date()
    }
}
