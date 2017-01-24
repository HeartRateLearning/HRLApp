//
//  ListWorkoutsListWorkoutsInitializer.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

class ListWorkoutsModuleInitializer: NSObject {

    // MARK: - Outlets

    @IBOutlet weak var listworkoutsViewController: ListWorkoutsViewController!

    // MARK: - NSObject methods

    override func awakeFromNib() {
        let configurator = ListWorkoutsModuleConfigurator()

        configurator.configureModule(for: listworkoutsViewController)
    }
}
