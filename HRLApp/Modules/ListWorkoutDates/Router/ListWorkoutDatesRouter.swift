//
//  ListWorkoutDatesListWorkoutDatesRouter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

extension ListWorkoutDatesViewController {}

// MARK: - ListWorkoutDatesRouterInput methods

extension ListWorkoutDatesViewController: ListWorkoutDatesRouterInput {
    func presentHeartRates(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) {
        performSegue(withIdentifier: Segues.listHeartRates, sender: self)
    }
}

// MARK: - Private body

private extension ListWorkoutDatesViewController {

    // MARK: - Segues

    enum Segues {
        static let listHeartRates = "listHeartRatesSegue"
    }
}
