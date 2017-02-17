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
}

// MARK: - SaveWorkingOutsInteractorInput methods

extension SaveWorkingOutsInteractor: SaveWorkingOutsInteractorInput {
    func execute(withWorkoutIndex workoutIndex: Int, dateIndex: Int, workingOuts: [Bool]) {
        guard let workout = workoutStore.workout(at: workoutIndex) else {
            output.interactorDidFailToSaveWorkingOuts(self)

            return
        }

        let recordCount = workoutStore.recordCount(forWorkoutAt: workoutIndex, dateAt: dateIndex)
        guard let count = recordCount else {
            output.interactorDidFailToSaveWorkingOuts(self)

            return
        }

        guard count == workingOuts.count else {
            output.interactorDidFailToSaveWorkingOuts(self)

            return
        }

        var trainingData = [] as [Trainable.TrainingTuple]
        
        for index in 0..<count {
            let record = workoutStore.record(at: index,
                                             forWorkoutAt: workoutIndex,
                                             dateAt: dateIndex)!
            let workingOut = workingOuts[index]

            if shouldUpdateRecord(record, withWorkingOut: workingOut) {
                let heartRate = HeartRateRecord(date: record.date, bpm: record.bpm)
                trainingData.append((heartRate, workingOut))

                let updatedRecord = WorkoutRecord(heartRate: heartRate,
                                                  workingOut: WorkingOut(workingOut))
                workoutStore.replaceRecord(at: index,
                                           forWorkoutAt: workoutIndex,
                                           dateAt: dateIndex,
                                           with: updatedRecord)
            }
        }

        if !trainingData.isEmpty {
            let trainee = factory.makeTrainable(for: workout)
            
            trainee.fit(trainingData: trainingData)
        }

        output.interactorDidSaveWorkingOuts(self)
    }
}

// MARK: - Private body

private extension SaveWorkingOutsInteractor {
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
}
