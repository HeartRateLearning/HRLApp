//
//  ListWorkoutsListWorkoutsPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

// MARK: - Properties & public methods

class ListWorkoutsPresenter {
    weak var view: ListWorkoutsViewInput!
    var interactor: ListWorkoutsInteractorInput!
    var router: ListWorkoutsRouterInput!
}

// MARK: - ListWorkoutsModuleInput methods

extension ListWorkoutsPresenter: ListWorkoutsModuleInput {}

// MARK: - ListWorkoutsViewOutput methods

extension ListWorkoutsPresenter: ListWorkoutsViewOutput {
    func viewIsReady() {
    }

    func numberOfWorkouts() -> Int {
        return 0
    }

    func workout(at index: Int) -> String {
        return ""
    }
}

// MARK: - ListWorkoutsInteractorOutput methods

extension ListWorkoutsPresenter: ListWorkoutsInteractorOutput {}
