//
//  WorkoutIterator.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 24/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

struct WorkoutIterator {

    // MARK: - Private properties

    fileprivate let first: Workout
    fileprivate var last: Workout?

    // MARK: - Init

    init(first: Workout) {
        self.first = first
    }
}

// MARK: - IteratorProtocol methods

extension WorkoutIterator: IteratorProtocol {
    mutating func next() -> Workout? {
        guard last != nil else {
            last = first

            return first
        }

        let next = Workout(rawValue: last!.rawValue + 1)
        if next != nil {
            last = next
        }

        return next
    }
}
