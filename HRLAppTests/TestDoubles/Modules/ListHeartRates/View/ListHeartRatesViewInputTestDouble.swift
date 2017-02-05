//
//  ListHeartRatesViewInputTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 04/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

class ListHeartRatesViewInputTestDouble {

    // MARK: - Public properties

    fileprivate (set) var setupCount = 0

    fileprivate (set) var lastRecords: [FoundHeartRateRecord]?
}

// MARK: - ListHeartRatesViewInput methods

extension ListHeartRatesViewInputTestDouble: ListHeartRatesViewInput {
    func setup(with records: [FoundHeartRateRecord]) {
        setupCount += 1

        lastRecords = records
    }
}
