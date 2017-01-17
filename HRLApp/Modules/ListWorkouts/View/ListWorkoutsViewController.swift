//
//  ListWorkoutsListWorkoutsViewController.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

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

    // MARK: - UITableViewDataSource methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.numberOfWorkouts()
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier,
                                                 for: indexPath)
        cell.textLabel?.text = output.workout(at: indexPath.row)

        return cell
    }
}

// MARK: - ListWorkoutsViewInput methods

extension ListWorkoutsViewController: ListWorkoutsViewInput {
    func setupInitialState() {
    }
}

// MARK: - Private body

private extension ListWorkoutsViewController {
    enum Constants {
        static let cellIdentifier = "WorkoutCell"
    }
}