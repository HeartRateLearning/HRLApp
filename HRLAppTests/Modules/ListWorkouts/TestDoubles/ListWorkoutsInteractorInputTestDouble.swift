//
//  ListWorkoutsInteractorInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 17/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Public body

class ListWorkoutsInteractorInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var executeCount = 0
}

// MARK: - ListWorkoutsInteractorInput methods

extension ListWorkoutsInteractorInputTestDouble: ListWorkoutsInteractorInput {
    func execute() {
        executeCount += 1
    }
}
