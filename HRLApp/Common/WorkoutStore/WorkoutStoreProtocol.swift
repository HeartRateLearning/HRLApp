//
//  WorkoutStoreProtocol.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 27/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol WorkoutStoreProtocol {
    func workoutCount() -> Int
    func workout(at index: Int) -> Workout
    func appendWorkout(_ workout: Workout)
}
