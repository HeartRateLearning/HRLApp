//
//  WorkoutStore.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol WorkoutStoreProtocol {
    var workouts: [Workout] { get }
}

class WorkoutStore {
    private (set) var workouts = [] as [Workout]
}

extension WorkoutStore: WorkoutStoreProtocol {}
