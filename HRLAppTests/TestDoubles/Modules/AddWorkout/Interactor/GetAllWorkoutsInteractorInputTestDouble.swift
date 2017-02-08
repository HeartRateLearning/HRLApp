//
//  GetAllWorkoutsInteractorInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 24/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class GetAllWorkoutsInteractorInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var executeCount = 0
}

// MARK: - GetAllWorkoutsInteractorInput methods

extension GetAllWorkoutsInteractorInputTestDouble: GetAllWorkoutsInteractorInput {
    func execute() {
        executeCount += 1
    }
}
