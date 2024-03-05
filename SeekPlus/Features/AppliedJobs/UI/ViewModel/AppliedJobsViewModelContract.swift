//
//  AppliedJobsViewModelContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

protocol AppliedJobsViewModelContract: ObservableObject {
    var appliedJobs: [JobApiModel] { get }
    var activityIndicator: ActivityIndicatorEvent { get }
    var showPlaceholder: Bool { get }

    func loadData()
}
