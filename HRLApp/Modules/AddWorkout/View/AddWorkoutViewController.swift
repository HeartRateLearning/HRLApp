//
//  AddWorkoutAddWorkoutViewController.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

class AddWorkoutViewController: UIViewController {

    // MARK: - Dependencies

    var output: AddWorkoutViewOutput!

    // MARK: - Memory management

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

// MARK: - AddWorkoutViewInput methods

extension AddWorkoutViewController: AddWorkoutViewInput {
    func setupInitialState() {}
}
