//
//  HealthStoreFactorySingleton.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 02/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class HealthStoreFactorySingleton {

    // MARK: - Public properties

    static let sharedInstance = HealthStoreFactorySingleton()

    // MARK: - Private properties

    fileprivate var store: HealthStoreFactoryProtocol

    // MARK: - Init methods

    private init() {
        store = HealthStoreFactory()
    }
}

// MARK: - HealthStoreFactoryProtocol methods

extension HealthStoreFactorySingleton: HealthStoreFactoryProtocol {
    func setup() {
        store.setup()
    }

    func makeHeartRateReader() -> HeartRateReaderProtocol? {
        return store.makeHeartRateReader()
    }
}
