//
//  SaveWorkingOutsInteractor.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 06/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class SaveWorkingOutsInteractor {

    // MARK: - Dependencies

    weak var output: SaveWorkingOutsInteractorOutput!

    var factory: TrainableFactory!
    var workoutStore: WorkoutStoreProtocol!
    var workoutWriter: WorkoutWriterProtocol!
}

// MARK: - SaveWorkingOutsInteractorInput methods

extension SaveWorkingOutsInteractor: SaveWorkingOutsInteractorInput {
    func execute(withWorkoutIndex workoutIndex: Int, dateIndex: Int, workingOuts: [Bool]) {
        guard
            let workout = workoutStore.workout(at: workoutIndex),
            let count = workoutStore.recordCount(forWorkoutAt: workoutIndex, dateAt: dateIndex),
            count == workingOuts.count
            else {
                output.interactorDidFailToSaveWorkingOuts(self)

                return
        }

        var trainingData = [] as [Trainable.TrainingTuple]
        var workingOutDates = [] as [WorkingOutDate]
        
        for index in 0..<count {
            let record = workoutStore.record(at: index,
                                             forWorkoutAt: workoutIndex,
                                             dateAt: dateIndex)!
            let workingOut = workingOuts[index]

            if shouldUpdateRecord(record, withWorkingOut: workingOut) {
                let heartRate = HeartRateRecord(date: record.date, bpm: record.bpm)

                updateRecord(at: index,
                             forWorkoutAt: workoutIndex,
                             dateAt: dateIndex,
                             with: (heartRate: heartRate, workingOut: WorkingOut(workingOut)))

                trainingData.append((heartRate, workingOut))
            }

            workingOutDates.append((date: record.date, workingOut: workingOut))
        }

        if !trainingData.isEmpty {
            trainClassifier(for: workout, with: trainingData)
        }

        saveWorkingOutDates(workingOutDates, for: workout)

        output.interactorDidSaveWorkingOuts(self)
    }
}

// MARK: - Private body

private extension SaveWorkingOutsInteractor {

    // MARK: - Type definitions

    typealias WorkingOutDate = (date: Date, workingOut: Bool)

    // MARK: - Private methods

    func shouldUpdateRecord(_ record: WorkoutRecord, withWorkingOut workingOut: Bool) -> Bool {
        var result = false

        switch record.workingOut {
        case .unknown:
            result = true
        case .false:
            result = workingOut == true
        case .true:
            result = workingOut == false
        }

        return result
    }

    func updateRecord(at index: Int,
                      forWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int,
                      with tuple: (heartRate: HeartRateRecord, workingOut: WorkingOut)) {
        let updatedRecord = WorkoutRecord(heartRate: tuple.heartRate, workingOut: tuple.workingOut)

        workoutStore.replaceRecord(at: index,
                                   forWorkoutAt: workoutIndex,
                                   dateAt: dateIndex,
                                   with: updatedRecord)
    }

    func trainClassifier(for workout: Workout, with trainingData: [Trainable.TrainingTuple]) {
        let trainee = factory.makeTrainable(for: workout)

        trainee.fit(trainingData: trainingData)
    }

    func saveWorkingOutDates(_ workingOutDates: [WorkingOutDate], for workout: Workout) {
        let sortedDates = workingOutDates.sorted { $0.date < $1.date }

        var startIndex = 0

        while startIndex < sortedDates.count {
            if !sortedDates[startIndex].workingOut {
                startIndex += 1

                continue
            }

            var endIndex = startIndex

            while (endIndex + 1) < sortedDates.count && sortedDates[endIndex + 1].workingOut {
                endIndex += 1
            }

            if startIndex != endIndex {
                let start = sortedDates[startIndex].date
                let end = sortedDates[endIndex].date
                let handler: WorkoutWriterProtocol.CompletionHandler = { success in
                    print("\(String(workout)) from \(start) to \(end). Saved: \(success)")
                }

                workoutWriter.saveWorkout(workout,
                                          startingAt: start,
                                          endingAt: end,
                                          completionHandler: handler)
            }

            startIndex = endIndex + 1
        }
    }
}
