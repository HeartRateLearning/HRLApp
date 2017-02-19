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
    fileprivate (set) var makeHeartRateReaderCount = 0
    fileprivate (set) var makeWorkoutWriterCount = 0

    var makeHeartRateReaderResult: HeartRateReaderProtocol?
    var makeWorkoutWriterResult: WorkoutWriterProtocol?
}

// MARK: - HealthStoreFactoryProtocol methods

extension HealthStoreFactoryTestDouble: HealthStoreFactoryProtocol {
    func setup() {
        setupCount += 1
    }

    func makeHeartRateReader() -> HeartRateReaderProtocol? {
        makeHeartRateReaderCount += 1

        return makeHeartRateReaderResult
    }

    func makeWorkoutWriter() -> WorkoutWriterProtocol? {
        makeWorkoutWriterCount += 1

        return makeWorkoutWriterResult
    }
}
