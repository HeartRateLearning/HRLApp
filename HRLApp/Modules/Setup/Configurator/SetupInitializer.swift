//
//  SetupSetupInitializer.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

final class SetupModuleInitializer: NSObject {

    // MARK: - Outlets

    @IBOutlet weak var setupViewController: SetupViewController!

    // MARK: - NSObject methods

    override func awakeFromNib() {
        let coreDataStore = CoreDataWorkoutStoreSingleton.sharedInstance
        let healthStoreFactory = HealthStoreFactorySingleton.sharedInstance
        let configurator = SetupModuleConfigurator(coreDataStore: coreDataStore,
                                                   healthStoreFactory: healthStoreFactory)

        configurator.configureDependencies(for: setupViewController)
    }
}
