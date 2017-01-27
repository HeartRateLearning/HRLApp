//
//  WorkoutStoreDelegate.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 27/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol WorkoutStoreDelegate: class {
    func workoutStore(_ store: WorkoutStore, didAppendWorkoutAtIndex index: Int)
}
