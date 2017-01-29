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

    fileprivate var store: WorkoutStoreProtocol

    // MARK: - Init methods

    private init() {
        store = WorkoutStore()
    }
}

// MARK: - WorkoutStoreProtocol methods

extension WorkoutStoreSingleton: WorkoutStoreProtocol {
    weak var delegate: WorkoutStoreDelegate? {
        get {
            return store.delegate
        }
        set {
            store.delegate = newValue
        }
    }

    func workoutCount() -> Int {
        return store.workoutCount()
    }

    func workout(at index: Int) -> Workout? {
        return store.workout(at: index)
    }

    func appendWorkout(_ workout: Workout) {
        store.appendWorkout(workout)
    }

    func dateCount(forWorkoutAt workoutIndex: Int) -> Int? {
        return store.dateCount(forWorkoutAt: workoutIndex)
    }

    func date(at index: Int, forWorkoutAt workoutIndex: Int) -> Date? {
        return store.date(at: index, forWorkoutAt: workoutIndex)
    }

    func appendDate(_ date: Date, toWorkoutAt workoutIndex: Int) {
        store.appendDate(date, toWorkoutAt: workoutIndex)
    }
}