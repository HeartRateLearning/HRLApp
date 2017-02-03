//
//  ListHeartRatesListHeartRatesInitializer.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

class ListHeartRatesModuleInitializer: NSObject {

    // MARK: - Outlets

    @IBOutlet weak var listheartratesViewController: ListHeartRatesViewController!

    // MARK: - NSObject methods

    override func awakeFromNib() {
        let configurator = ListHeartRatesModuleConfigurator()

        configurator.configureDependencies(for: listheartratesViewController)
    }

}
