//
//  ListHeartRatesListHeartRatesPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

// MARK: - Main body

final class ListHeartRatesPresenter {

    // MARK: - Dependencies

    weak var view: ListHeartRatesViewInput!
    weak var router: ListHeartRatesRouterInput!

    var getHeartRates: GetHeartRatesInteractorInput!
    var saveWorkingOuts: SaveWorkingOutsInteractorInput!

    // MARK: - Private properties

    fileprivate var workoutIndex: Int?
    fileprivate var dateIndex: Int?
}

// MARK: - ListHeartRatesModuleInput methods

extension ListHeartRatesPresenter: ListHeartRatesModuleInput {
    func configure(withWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) {
        self.workoutIndex = workoutIndex
        self.dateIndex = dateIndex

        getHeartRates.execute(withWorkoutIndex: workoutIndex, dateIndex: dateIndex)
    }
}

// MARK: - ListHeartRatesViewOutput methods

extension ListHeartRatesPresenter: ListHeartRatesViewOutput {
    func save(workingOuts: [Bool]) {
        guard let workoutIndex = workoutIndex, let dateIndex = dateIndex else {
            return
        }

        saveWorkingOuts.execute(withWorkoutIndex: workoutIndex,
                                dateIndex: dateIndex,
                                workingOuts: workingOuts)
    }
}

// MARK: - ListHeartRatesInteractorOutput methods

extension ListHeartRatesPresenter: GetHeartRatesInteractorOutput {
    func interactor(_ interactor: GetHeartRatesInteractorInput,
                    didFindHeartRates records: [FoundHeartRateRecord]) {
        view.setup(with: records)
    }
}

// MARK: - SaveWorkingOutsInteractorOutput methods

extension ListHeartRatesPresenter: SaveWorkingOutsInteractorOutput {
    func interactorDidSaveWorkingOuts(_ interactor: SaveWorkingOutsInteractorInput) {
        router.presentWorkoutDateList()
    }

    func interactorDidFailToSaveWorkingOuts(_ interactor: SaveWorkingOutsInteractorInput) {
        print("ListHeartRatesPresenter: SaveWorkingOutsInteractor: didFailToSaveWorkingOuts")
    }
}
