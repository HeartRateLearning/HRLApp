//
//  ListWorkoutDatesListWorkoutDatesPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

class ListWorkoutDatesPresenter {

    // MARK: - Dependencies

    weak var view: ListWorkoutDatesViewInput!
    weak var router: ListWorkoutDatesRouterInput!
    
    var interactor: GetWorkoutDatesInteractorInput!

    // MARK: - Private properties

    fileprivate var workoutIndex: Int?
}

// MARK: - ListWorkoutDatesModuleInput methods

extension ListWorkoutDatesPresenter: ListWorkoutDatesModuleInput {
    func configure(withWorkoutAt index: Int) {
        workoutIndex = index

        interactor.execute(withWorkoutIndex: index)
    }
}

// MARK: - ListWorkoutDatesViewOutput methods

extension ListWorkoutDatesPresenter: ListWorkoutDatesViewOutput {
    func didSelectDate(at index: Int) {
        guard let workoutIndex = workoutIndex else {
            return
        }

        router.presentHeartRates(forWorkoutAt: workoutIndex, dateAt: index)
    }
}

// MARK: - GetWorkoutDatesInteractorOutput methods

extension ListWorkoutDatesPresenter: GetWorkoutDatesInteractorOutput {
    func interactor(_ interactor: GetWorkoutDatesInteractorInput,
                    didFindWorkoutDates dates: [Date]) {
        view.setup(with: dates)
    }
}
