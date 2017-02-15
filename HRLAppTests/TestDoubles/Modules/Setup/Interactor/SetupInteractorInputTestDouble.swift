//
//  SetupInteractorInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class SetupInteractorInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var executeCount = 0
}

// MARK: - SetupInteractorInput methods

extension SetupInteractorInputTestDouble: SetupInteractorInput {
    func execute() {
        executeCount += 1
    }
}
