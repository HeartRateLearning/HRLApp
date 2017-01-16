//
//  ListWorkoutsListWorkoutsViewController.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Properties & public methods

class ListWorkoutsViewController: UITableViewController {

    // MARK: - Public properties

    var output: ListWorkoutsViewOutput!

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

// MARK: - ListWorkoutsViewInput methods

extension ListWorkoutsViewController: ListWorkoutsViewInput {
    func setupInitialState() {
    }
}
