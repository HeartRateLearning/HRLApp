//
//  SaveWorkingOutsInteractorOutputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 06/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class SaveWorkingOutsInteractorOutputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var didSaveCount = 0
    fileprivate (set) var didFailCount = 0
}

// MARK: - SaveWorkingOutsInteractorOutput methods

extension SaveWorkingOutsInteractorOutputTestDouble: SaveWorkingOutsInteractorOutput {
    func interactorDidSaveWorkingOuts(_ interactor: SaveWorkingOutsInteractorInput) {
        didSaveCount += 1
    }

    func interactorDidFailToSaveWorkingOuts(_ interactor: SaveWorkingOutsInteractorInput) {
        didFailCount += 1
    }
}
