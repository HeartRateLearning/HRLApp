//
//  ListHeartRatesListHeartRatesPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

// MARK: - Main body

class ListHeartRatesPresenter {

    // MARK: - Dependencies

    weak var view: ListHeartRatesViewInput!

    var router: ListHeartRatesRouterInput!
    var interactor: GetHeartRatesInteractorInput!
}

// MARK: - ListHeartRatesModuleInput methods

extension ListHeartRatesPresenter: ListHeartRatesModuleInput {
    func configure(withWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) {
        interactor.execute(withWorkoutIndex: workoutIndex, dateIndex: dateIndex)
    }
}

// MARK: - ListHeartRatesViewOutput methods

extension ListHeartRatesPresenter: ListHeartRatesViewOutput {}

// MARK: - ListHeartRatesInteractorOutput methods

extension ListHeartRatesPresenter: GetHeartRatesInteractorOutput {
    func interactor(_ interactor: GetHeartRatesInteractorInput,
                    didFindHeartRates records: [HeartRateRecord]) {
        view.setup(with: records)
    }
}
