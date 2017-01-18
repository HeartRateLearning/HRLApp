//
//  ListWorkoutsListWorkoutsPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

// MARK: - Main body

class ListWorkoutsPresenter {
    
    // MARK: - Dependencies

    weak var view: ListWorkoutsViewInput!

    var router: ListWorkoutsRouterInput!
    var interactor: ListWorkoutsInteractorInput!

    // MARK: - Private properties

    fileprivate var workouts = [] as [String]
}

// MARK: - ListWorkoutsModuleInput methods

extension ListWorkoutsPresenter: ListWorkoutsModuleInput {}

// MARK: - ListWorkoutsViewOutput methods

extension ListWorkoutsPresenter: ListWorkoutsViewOutput {
    func viewIsReady() {
        interactor.execute()
    }

    func numberOfWorkouts() -> Int {
        return workouts.count
    }

    func workout(at index: Int) -> String {
        return workouts[index]
    }

    func add() {
        router.presentAddWorkout()
    }
}

// MARK: - ListWorkoutsInteractorOutput methods

extension ListWorkoutsPresenter: ListWorkoutsInteractorOutput {
    func foundWorkouts(_ workouts: [String]) {
        self.workouts = workouts

        view.setupInitialState()
    }
}
