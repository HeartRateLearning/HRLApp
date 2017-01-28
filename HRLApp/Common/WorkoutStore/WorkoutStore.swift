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

    // MARK: - WorkoutStoreProtocol properties

    weak var delegate: WorkoutStoreDelegate?

    // MARK: - Private properties

    fileprivate var workouts = [] as [Data]
}

// MARK: - WorkoutStoreProtocol methods

extension WorkoutStore: WorkoutStoreProtocol {
    func workoutCount() -> Int {
        return workouts.count
    }

    func workout(at index: Int) -> Workout? {
        let data = workoutData(at: index)

        return data?.workout
    }

    func appendWorkout(_ workout: Workout) {
        let data = Data(workout: workout)

        workouts.append(data)

        delegate?.workoutStore(self, didAppendWorkoutAtIndex: workouts.count - 1)
    }

    func dateCount(forWorkoutAt workoutIndex: Int) -> Int? {
        let data = workoutData(at: workoutIndex)
        let dates = data?.dates

        return dates?.count
    }

    func date(at index: Int, forWorkoutAt workoutIndex: Int) -> Date? {
        guard let data = workoutData(at: workoutIndex) else {
            return nil
        }

        guard index < data.dates.count else {
            return nil
        }

        return data.dates[index]
    }

    func appendDate(_ date: Date, toWorkoutAt workoutIndex: Int) {
        guard let data = workoutData(at: workoutIndex) else {
            return
        }

        data.dates.append(date)
    }
}

// MARK: - Private body

private extension WorkoutStore {

    // MARK: - Type definitions

    class Data {
        let workout: Workout
        var dates: [Date]

        init(workout: Workout, dates: [Date] = []) {
            self.workout = workout
            self.dates = dates
        }
    }

    // MARK: - Private methods

    func workoutData(at index: Int) -> Data? {
        guard index < workouts.count else {
            return nil
        }

        return workouts[index]
    }
}
