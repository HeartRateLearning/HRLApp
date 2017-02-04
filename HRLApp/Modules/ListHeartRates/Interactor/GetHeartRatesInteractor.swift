//
//  GetHeartRatesInteractor.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

// MARK: - Main body

class GetHeartRatesInteractor {

    // MARK: - Dependencies

    weak var output: GetHeartRatesInteractorOutput!

    var workoutStore: WorkoutStoreProtocol!
    var heartRateStore: HeartRateStoreProtocol!
}

// MARK: - GetHeartRatesInteractorInput methods

extension GetHeartRatesInteractor: GetHeartRatesInteractorInput {
    func execute(withWorkoutIndex workoutIndex: Int, dateIndex: Int) {
        guard let date = workoutStore.date(at: dateIndex, forWorkoutAt: workoutIndex) else {
            output.interactor(self, didFindHeartRates: [])

            return
        }

        heartRateStore.queryRecords(from: date) { [weak self] (records) in
            guard let strongSelf = self else {
                return
            }

            strongSelf.output.interactor(strongSelf, didFindHeartRates: records)
        }
    }
}
