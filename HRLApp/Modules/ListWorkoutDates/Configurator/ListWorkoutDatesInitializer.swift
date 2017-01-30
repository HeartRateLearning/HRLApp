//
//  ListWorkoutDatesListWorkoutDatesInitializer.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

class ListWorkoutDatesModuleInitializer: NSObject {

    // MARK: - Outlets

    @IBOutlet weak var listworkoutdatesViewController: ListWorkoutDatesViewController!

    // MARK: - NSObject methods

    override func awakeFromNib() {
        let configurator = ListWorkoutDatesModuleConfigurator()

        configurator.configureDependencies(for: listworkoutdatesViewController)
    }

}
