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
    var interactor: GetStoredWorkoutsInteractorInput!

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

    func didSelectWorkout(at index: Int) {
        print("Selected workout at \(index)")
    }
}

// MARK: - GetStoredWorkoutsInteractorOutput methods

extension ListWorkoutsPresenter: GetStoredWorkoutsInteractorOutput {
    func interactor(_ interactor: GetStoredWorkoutsInteractorInput,
                    didFindWorkouts workouts: [String]) {
        self.workouts = workouts

        view.setupInitialState()
    }
}
