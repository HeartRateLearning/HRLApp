//
//  WorkoutStoreSingleton.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 27/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

class WorkoutStoreSingleton {

    // MARK: - Public properties

    static let sharedInstance = WorkoutStoreSingleton()

    // MARK: - Private properties

    fileprivate let store: WorkoutStore

    // MARK: - Init methods

    private init() {
        store = WorkoutStore()
    }
}

// MARK: - WorkoutStoreProtocol methods

extension WorkoutStoreSingleton: WorkoutStoreProtocol {
    func workoutCount() -> Int {
        return store.workoutCount()
    }

    func workout(at index: Int) -> Workout {
        return store.workout(at: index)
    }

    func appendWorkout(_ workout: Workout) {
        store.appendWorkout(workout)
    }
}
