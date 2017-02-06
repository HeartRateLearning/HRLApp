//
//  SaveWorkingOutsInteractorInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 07/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class SaveWorkingOutsInteractorInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var executeCount = 0

    fileprivate (set) var lastWorkoutIndex = -1
    fileprivate (set) var lastDateIndex = -1
    fileprivate (set) var lastWorkingOuts: [Bool]?
}

// MARK: - SaveWorkingOutsInteractorInput methods

extension SaveWorkingOutsInteractorInputTestDouble: SaveWorkingOutsInteractorInput {
    func execute(withWorkoutIndex workoutIndex: Int, dateIndex: Int, workingOuts: [Bool]) {
        executeCount += 1

        lastWorkoutIndex = workoutIndex
        lastDateIndex = dateIndex
        lastWorkingOuts = workingOuts
    }
}
