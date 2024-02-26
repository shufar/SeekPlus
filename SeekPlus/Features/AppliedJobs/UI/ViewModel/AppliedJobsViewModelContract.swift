//
//  AppliedJobsViewModelContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

protocol AppliedJobsViewModelContract: ObservableObject {
    var appliedJobs: [JobApiModel] { get }

    func loadData()
}
