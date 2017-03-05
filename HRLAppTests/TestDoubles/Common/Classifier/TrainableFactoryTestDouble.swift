//
//  TrainableFactoryTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 17/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class TrainableFactoryTestDouble {

    // MARK: - Public properties

    fileprivate (set) var makeTrainableCount = 0

    var makeTrainableResult = TrainableTestDouble()
}

// MARK: - TrainableFactory methods

extension TrainableFactoryTestDouble: TrainableFactory {
    func makeTrainable(workout: Workout) -> Trainable {
        makeTrainableCount += 1

        return makeTrainableResult
    }
}
