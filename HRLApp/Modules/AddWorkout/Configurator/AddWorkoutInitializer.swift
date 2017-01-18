//
//  AddWorkoutAddWorkoutInitializer.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class AddWorkoutModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var addworkoutViewController: AddWorkoutViewController!

    override func awakeFromNib() {

        let configurator = AddWorkoutModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: addworkoutViewController)
    }

}
