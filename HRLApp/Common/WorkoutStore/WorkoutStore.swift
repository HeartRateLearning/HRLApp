//
//  WorkoutStore.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol WorkoutStoreProtocol {
    func workoutCount() -> Int
    func workout(at index: Int) -> Workout
    func appendWorkout(_ workout: Workout)
}

class WorkoutStore {
    fileprivate var workouts = [] as [Workout]
}

extension WorkoutStore: WorkoutStoreProtocol {
    func workoutCount() -> Int {
        return workouts.count
    }

    func workout(at index: Int) -> Workout {
        return workouts[index]
    }

    func appendWorkout(_ workout: Workout) {
        workouts.append(workout)
    }
}
