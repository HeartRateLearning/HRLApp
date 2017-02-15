//
//  PersistableWorkoutStore.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 12/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol PersistableWorkoutStore {
    func workoutCount() -> Int
    func isWorkoutPersisted(_ workout: Workout) -> Bool
    func persistedWorkout(at index: Int) -> Workout?
    func appendWorkout(_ workout: Workout)

    func dateCount(forWorkoutAt workoutIndex: Int) -> Int?
    func isDatePersisted(_ date: Date, forWorkoutAt workoutIndex: Int) -> Bool
    func persistedDate(at index: Int, forWorkoutAt workoutIndex: Int) -> Date?
    func appendDate(_ date: Date, toWorkoutAt workoutIndex: Int)

    func recordCount(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> Int?
    func persistedRecord(at index: Int,
                         forWorkoutAt workoutIndex: Int,
                         dateAt dateIndex: Int) -> WorkoutRecord?
    func appendRecord(_ record: WorkoutRecord,
                      toWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int)
    func insertRecord(_ record: WorkoutRecord,
                      intoWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int,
                      recordAt recordIndex: Int)

    func mostRecentRecord(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> WorkoutRecord?
}
