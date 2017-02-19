//
//  WorkoutWriter.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 18/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HealthKit

// MARK: - Main body

final class WorkoutWriter {

    // MARK: - Public class properties

    static let workoutType = HKObjectType.workoutType()

    // MARK: - Private properties

    fileprivate let store: HKHealthStore

    // MARK: - Init methods

    init(store: HKHealthStore) {
        self.store = store
    }
}

// MARK: - WorkoutWriterProtocol methods

extension WorkoutWriter: WorkoutWriterProtocol {
    func saveWorkout(_ workout: Workout,
                     startingAt start: Date,
                     endingAt end: Date,
                     completionHandler: @escaping WorkoutWriterProtocol.CompletionHandler) {
        let hkWorkout = HKWorkout(activityType: HKWorkoutActivityType(workout),
                                  start: start,
                                  end: end)

        store.save(hkWorkout) { (success, _) in
            DispatchQueue.main.async {
                completionHandler(success)
            }
        }
    }
}
