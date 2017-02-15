//
//  SetupSetupInitializer.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class SetupModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var setupViewController: SetupViewController!

    override func awakeFromNib() {

        let configurator = SetupModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: setupViewController)
    }

}
