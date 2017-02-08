//
//  ListHeartRatesListHeartRatesViewController.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

final class ListHeartRatesViewController: UIViewController {

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

    fileprivate var records = [] as [FoundHeartRateRecord]

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func save(_ sender: Any) {
        let workingOuts = records.map { (record) -> Bool in
            return record.workingOut
        }

        output.save(workingOuts: workingOuts)
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

// MARK: - UITableViewDelegate methods

extension ListHeartRatesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        let record = records[indexPath.row]

        if record.workingOut {
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
        else {
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        replaceRecord(at: indexPath.row, withWorkingOut: true)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        replaceRecord(at: indexPath.row, withWorkingOut: false)
    }
}

// MARK: - ListHeartRatesViewInput methods

extension ListHeartRatesViewController: ListHeartRatesViewInput {
    func setup(with records: [FoundHeartRateRecord]) {
        self.records = records

        if isViewLoaded {
            tableView.reloadData()
        }
    }
}

// MARK: - Private body

private extension ListHeartRatesViewController {

    // MARK: - Constants

    enum Constants {
        static let cellIdentifier = "HeartRateCell"
    }

    // MARK: - Private methods

    func replaceRecord(at index: Int, withWorkingOut workingOut: Bool) {
        let oldRecord = records[index]
        let nextRecord = FoundHeartRateRecord(date: oldRecord.date,
                                              bpm: oldRecord.bpm,
                                              workingOut: workingOut)
        records[index] = nextRecord
    }
}
