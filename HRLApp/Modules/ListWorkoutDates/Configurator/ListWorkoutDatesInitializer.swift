//
//  ListWorkoutDatesListWorkoutDatesInitializer.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class ListWorkoutDatesModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var listworkoutdatesViewController: ListWorkoutDatesViewController!

    override func awakeFromNib() {

        let configurator = ListWorkoutDatesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: listworkoutdatesViewController)
    }

}
