//
//  WorkoutStore.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

class WorkoutStore {

    // MARK: - Public properties

    weak var delegate: WorkoutStoreDelegate?

    // MARK: - Private properties

    fileprivate var workouts = [] as [Workout]
}

// MARK: - WorkoutStoreProtocol methods

extension WorkoutStore: WorkoutStoreProtocol {
    func workoutCount() -> Int {
        return workouts.count
    }

    func workout(at index: Int) -> Workout {
        return workouts[index]
    }

    func appendWorkout(_ workout: Workout) {
        workouts.append(workout)

        delegate?.workoutStore(self, didAppendWorkoutAtIndex: workouts.count - 1)
    }
}
