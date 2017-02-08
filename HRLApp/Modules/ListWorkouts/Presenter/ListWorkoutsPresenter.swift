//
//  ListWorkoutsListWorkoutsPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

// MARK: - Main body

final class ListWorkoutsPresenter {
    
    // MARK: - Dependencies

    weak var view: ListWorkoutsViewInput!
    weak var router: ListWorkoutsRouterInput!

    var interactor: GetStoredWorkoutsInteractorInput!
}

// MARK: - ListWorkoutsModuleInput methods

extension ListWorkoutsPresenter: ListWorkoutsModuleInput {}

// MARK: - ListWorkoutsViewOutput methods

extension ListWorkoutsPresenter: ListWorkoutsViewOutput {
    func viewIsReady() {
        interactor.execute()
    }

    func add() {
        router.presentAddWorkout()
    }

    func didSelectWorkout(at index: Int) {
        router.presentDateList(forWorkoutAt: index)
    }
}

// MARK: - GetStoredWorkoutsInteractorOutput methods

extension ListWorkoutsPresenter: GetStoredWorkoutsInteractorOutput {
    func interactor(_ interactor: GetStoredWorkoutsInteractorInput,
                    didFindWorkouts workouts: [String]) {
        view.setup(with: workouts)
    }
}
