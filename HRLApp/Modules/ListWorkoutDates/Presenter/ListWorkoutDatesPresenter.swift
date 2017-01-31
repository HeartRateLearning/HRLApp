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
        print("Configure with \(index)")
    }
}

// MARK: - ListWorkoutDatesViewOutput methods

extension ListWorkoutDatesPresenter: ListWorkoutDatesViewOutput {
    func viewIsReady() {}

    func numberOfDates() -> Int {
        return 10
    }

    func date(at index: Int) -> Date {
        return Date()
    }
}

// MARK: - GetWorkoutDatesInteractorOutput methods

extension ListWorkoutDatesPresenter: GetWorkoutDatesInteractorOutput {
    func interactor(_ interactor: GetWorkoutDatesInteractorInput,
                    didFindWorkoutDates dates: [Date]) {
    }
}
