//
//  ListHeartRatesListHeartRatesViewController.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

class ListHeartRatesViewController: UIViewController {

    // MARK: - Dependencies

    var output: ListHeartRatesViewOutput!

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Private properties

    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short

        return formatter
    }()

    fileprivate var records = [] as [HeartRateRecord]

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource methods

extension ListHeartRatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier,
                                                 for: indexPath)
        let record = records[indexPath.row]

        cell.textLabel?.text = String(record.bpm)
        cell.detailTextLabel?.text = dateFormatter.string(from: record.date)

        return cell
    }
}

// MARK: - ListHeartRatesViewInput methods

extension ListHeartRatesViewController: ListHeartRatesViewInput {
    func setup(with records: [HeartRateRecord]) {
        self.records = records

        if isViewLoaded {
            tableView.reloadData()
        }
    }
}

// MARK: - Private body

private extension ListHeartRatesViewController {
    enum Constants {
        static let cellIdentifier = "HeartRateCell"
    }
}
