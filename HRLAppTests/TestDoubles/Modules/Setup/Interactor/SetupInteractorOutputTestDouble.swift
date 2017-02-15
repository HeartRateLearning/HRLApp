//
//  SetupInteractorOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class SetupInteractorOutputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var didPerformSetupCount = 0
}

// MARK: - SetupInteractorOutput methods

extension SetupInteractorOutputTestDouble: SetupInteractorOutput {
    func interactorDidPerformSetup(_ interactor: SetupInteractorInput) {
        didPerformSetupCount += 1
    }
}
