//
//  AddWorkoutAddWorkoutInitializer.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

class AddWorkoutModuleInitializer: NSObject {

    // MARK: - Outlets

    @IBOutlet weak var addWorkoutViewController: AddWorkoutViewController!

    // MARK: - NSObject methods

    override func awakeFromNib() {
        let configurator = AddWorkoutModuleConfigurator()
        
        configurator.configureModule(for: addWorkoutViewController)
    }
}
