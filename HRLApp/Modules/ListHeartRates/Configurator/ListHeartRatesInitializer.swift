//
//  ListHeartRatesListHeartRatesInitializer.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class ListHeartRatesModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var listheartratesViewController: ListHeartRatesViewController!

    override func awakeFromNib() {

        let configurator = ListHeartRatesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: listheartratesViewController)
    }

}
