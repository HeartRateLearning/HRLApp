//
//  GetWorkoutDatesInteractorOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 31/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class GetWorkoutDatesInteractorOutputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var didFindDatesCount = 0

    fileprivate (set) var lastFoundDates = [] as [Date]
}

// MARK: - GetWorkoutDatesInteractorOutput methods

extension GetWorkoutDatesInteractorOutputTestDouble: GetWorkoutDatesInteractorOutput {
    func interactor(_ interactor: GetWorkoutDatesInteractorInput,
                    didFindWorkoutDates dates: [Date]) {
        didFindDatesCount += 1

        lastFoundDates = dates
    }
}
