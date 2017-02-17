//
//  WorkoutStoreProtocol.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 27/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol WorkoutStoreProtocol: class {
    // A multicast delegate would be more appropiate here, than a simple delegate
    weak var delegate: WorkoutStoreDelegate? { get set }

    func workoutCount() -> Int
    func workout(at index: Int) -> Workout?
    func appendWorkout(_ workout: Workout)

    func dateCount(forWorkoutAt workoutIndex: Int) -> Int?
    func date(at index: Int, forWorkoutAt workoutIndex: Int) -> Date?
    func appendDate(_ date: Date, toWorkoutAt workoutIndex: Int)

    func recordCount(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> Int?
    func record(at index: Int,
                forWorkoutAt workoutIndex: Int,
                dateAt dateIndex: Int) -> WorkoutRecord?
    func appendRecord(_ record: WorkoutRecord,
                      toWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int)
    func replaceRecord(at index: Int,
                       forWorkoutAt workoutIndex: Int,
                       dateAt dateIndex: Int,
                       with record: WorkoutRecord)

    func mostRecentRecord(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> WorkoutRecord?
}
