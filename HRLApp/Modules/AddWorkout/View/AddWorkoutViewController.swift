//
//  AddWorkoutAddWorkoutViewController.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class AddWorkoutViewController: UIViewController, AddWorkoutViewInput {

    var output: AddWorkoutViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AddWorkoutViewInput
    func setupInitialState() {
    }
}
