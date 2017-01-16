//
//  ListWorkoutsListWorkoutsInitializer.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class ListWorkoutsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var listworkoutsViewController: ListWorkoutsViewController!

    override func awakeFromNib() {

        let configurator = ListWorkoutsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: listworkoutsViewController)
    }

}
