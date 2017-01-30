//
//  ListWorkoutDatesListWorkoutDatesViewController.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

class ListWorkoutDatesViewController: UITableViewController {

    // MARK: - Dependencies

    var output: ListWorkoutDatesViewOutput!

    // MARK: - Private properties

    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short

        return formatter
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }

    // MARK: - UITableViewDataSource methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.numberOfDates()
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier,
                                                 for: indexPath)
        let date = output.date(at: indexPath.row)

        cell.textLabel?.text = dateFormatter.string(from: date)

        return cell
    }
}

// MARK: - ListWorkoutDatesViewInput methods

extension ListWorkoutDatesViewController: ListWorkoutDatesViewInput {
    func setupInitialState() {
        tableView.reloadData()
    }
}

// MARK: - Private body

private extension ListWorkoutDatesViewController {
    enum Constants {
        static let cellIdentifier = "DateCell"
    }
}
