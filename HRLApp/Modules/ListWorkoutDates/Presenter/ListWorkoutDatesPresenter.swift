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

    var router: ListWorkoutDatesRouterInput!
    var interactor: GetWorkoutDatesInteractorInput!
}

// MARK: - ListWorkoutDatesModuleInput methods

extension ListWorkoutDatesPresenter: ListWorkoutDatesModuleInput {
    func configure(withWorkoutAt index: Int) {
        interactor.execute(withWorkoutIndex: index)
    }
}

// MARK: - ListWorkoutDatesViewOutput methods

extension ListWorkoutDatesPresenter: ListWorkoutDatesViewOutput {}

// MARK: - GetWorkoutDatesInteractorOutput methods

extension ListWorkoutDatesPresenter: GetWorkoutDatesInteractorOutput {
    func interactor(_ interactor: GetWorkoutDatesInteractorInput,
                    didFindWorkoutDates dates: [Date]) {
        view.setup(with: dates)
    }
}
