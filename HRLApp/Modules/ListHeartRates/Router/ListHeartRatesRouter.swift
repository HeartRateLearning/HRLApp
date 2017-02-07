//
//  ListHeartRatesRouter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

extension ListHeartRatesViewController {

    // MARK: - Overrided methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}

// MARK: - ListHeartRatesRouterInput methods

extension ListHeartRatesViewController: ListHeartRatesRouterInput {
    func presentWorkoutDateList() {
        performSegue(withIdentifier: Segues.unwindListHeartRates, sender: self)
    }
}

// MARK: - Private body

private extension ListHeartRatesViewController {

    // MARK: - Segues

    enum Segues {
        static let unwindListHeartRates = "listHeartRatesUnwindSegue"
    }
}

