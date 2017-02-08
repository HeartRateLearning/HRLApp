//
//  HealthStoreFactoryTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class HealthStoreFactoryTestDouble {

    // MARK: - Public properties

    fileprivate (set) var setupCount = 0
    fileprivate (set) var makeHeartRateStoreCount = 0

    var makeHeartRateStoreResult: HeartRateStoreProtocol?
}

// MARK: - HealthStoreFactoryProtocol methods

extension HealthStoreFactoryTestDouble: HealthStoreFactoryProtocol {
    func setup() {
        setupCount += 1
    }

    func makeHeartRateStore() -> HeartRateStoreProtocol? {
        makeHeartRateStoreCount += 1

        return makeHeartRateStoreResult
    }
}
