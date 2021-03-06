//
//  ListWorkoutsListWorkoutsViewController.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

@objc(HRLListWorkoutsViewController)
final class ListWorkoutsViewController: UITableViewController {

    // MARK: - Dependencies

    var output: ListWorkoutsViewOutput!

    // MARK: - Private properties

    fileprivate var workouts = [] as [String]

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }

    // MARK: - Actions

    @IBAction func add(_ sender: Any) {
        output.add()
    }

    // MARK: - UITableViewDataSource methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier,
                                                 for: indexPath)
        cell.textLabel?.text = workouts[indexPath.row]

        return cell
    }

    // MARK: - UITableViewDelegate methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectWorkout(at: indexPath.row)
    }
}

// MARK: - ListWorkoutsViewInput methods

extension ListWorkoutsViewController: ListWorkoutsViewInput {
    func setup(with workouts: [String]) {
        self.workouts = workouts

        if isViewLoaded {
            tableView.reloadData()
        }
    }
}

// MARK: - Private body

private extension ListWorkoutsViewController {
    enum Constants {
        static let cellIdentifier = "WorkoutCell"
    }
}
