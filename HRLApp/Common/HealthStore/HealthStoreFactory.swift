//
//  HealthStoreFactory.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 01/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HealthKit

// MARK: - Main body

final class HealthStoreFactory {

    // MARK: - Private properties

    fileprivate var state = State.rejected
}

// MARK: - HealthStoreFactoryProtocol methods

extension HealthStoreFactory: HealthStoreFactoryProtocol {
    func setup() {
        guard !isRequestingAuthorization() else {
            print("Already requesting authorization")

            return
        }

        requestAuthorization()
    }

    func makeHeartRateReader() -> HeartRateReaderProtocol? {
        guard let currentStore = currentHealthStore() else {
            return nil
        }

        return HeartRateReader(store: currentStore)
    }
}

// MARK: - Private body

private extension HealthStoreFactory {

    // MARK: - Type definitions

    enum State {
        case requesting
        case rejected
        case authorized(HKHealthStore)

        init(isAuthorized: Bool, store: HKHealthStore) {
            self = isAuthorized ? .authorized(store) : .rejected
        }
    }

    // MARK: - Constants

    enum Constants {
        static let typesToShare = nil as Set<HKSampleType>?
        static let typesToRead = Set(arrayLiteral: HeartRateReader.heartRateType)
    }

    // MARK: - Private methods

    func isRequestingAuthorization() -> Bool {
        var isRequesting = false

        switch state {
        case .requesting:
            isRequesting = true
        default:
            isRequesting = false
        }

        return isRequesting
    }

    func requestAuthorization() {
        guard HKHealthStore.isHealthDataAvailable() else {
            print("Health data is NOT available")

            state = .rejected

            return
        }

        state = .requesting

        let store = HKHealthStore()

        let completion = { [weak self] (success: Bool, error: Error?) in
            if !success {
                print("Request authorization failed: \(error)")
            }

            DispatchQueue.main.async {
                self?.state = State(isAuthorized: success, store: store)
            }
        }

        store.requestAuthorization(toShare: Constants.typesToShare,
                                   read: Constants.typesToRead,
                                   completion: completion)
    }

    func currentHealthStore() -> HKHealthStore? {
        var currentStore: HKHealthStore?

        switch state {
        case .authorized(let store):
            currentStore = store
        default:
            currentStore = nil
        }

        return currentStore
    }
}
