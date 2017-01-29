//
//  ListWorkoutsListWorkoutsRouter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

// MARK: - Main body

class ListWorkoutsRouter {

    // MARK: - Segues

    enum Segues {
        static let addWorkout = "addWorkoutSegue"
        static let listDates = "listDatesSegue"
    }

    // MARK: - Dependencies

    weak var viewController: ListWorkoutsViewController!
}

// MARK: - ListWorkoutsRouterInput methods

extension ListWorkoutsRouter: ListWorkoutsRouterInput {
    func presentAddWorkout() {
        viewController.performSegue(withIdentifier: Segues.addWorkout, sender: viewController)
    }

    func presentDateList(forWorkoutAt index: Int) {
        viewController.performSegue(withIdentifier: Segues.listDates, sender: viewController)
    }
}
