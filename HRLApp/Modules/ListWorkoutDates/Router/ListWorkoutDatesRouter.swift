//
//  ListWorkoutDatesListWorkoutDatesRouter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

extension ListWorkoutDatesViewController {

    // MARK: - Overrided methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = sender as? Index else {
            return
        }

        configureListHeartRatesModule(for: segue.destination, with: index)
    }

    // MARK: - Unwind actions

    @IBAction func unwindHeartRateList(_ segue: UIStoryboardSegue) {}
}

// MARK: - ListWorkoutDatesRouterInput methods

extension ListWorkoutDatesViewController: ListWorkoutDatesRouterInput {
    func presentHeartRates(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) {
        let index = Index(workout: workoutIndex, date: dateIndex)

        performSegue(withIdentifier: Segues.listHeartRates, sender: index)
    }
}

// MARK: - Private body

private extension ListWorkoutDatesViewController {

    // MARK: - Type definitions

    struct Index {
        let workout: Int
        let date: Int
    }

    // MARK: - Segues

    enum Segues {
        static let listHeartRates = "listHeartRatesSegue"
    }

    // MARK: - Private methods

    func configureListHeartRatesModule(for viewInput: UIViewController, with index: Index) {
        let configurator = ListHeartRatesModuleConfigurator()

        configurator.configureModule(for: viewInput,
                                     withWorkoutAt: index.workout,
                                     dateAt: index.date)
    }
}
