//
//  GetConfiguredWorkoutsInteractorInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 23/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class GetConfiguredWorkoutsInteractorInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var executeCount = 0
}

// MARK: - GetConfiguredWorkoutsInteractorInput methods

extension GetConfiguredWorkoutsInteractorInputTestDouble: GetConfiguredWorkoutsInteractorInput {
    func execute() {
        executeCount += 1
    }
}
