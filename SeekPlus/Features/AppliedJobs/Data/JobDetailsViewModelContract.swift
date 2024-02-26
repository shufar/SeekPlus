//
//  JobDetailsViewModelContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

protocol JobDetailsViewModelContract: ObservableObject {
    var jobDetails: JobDetailsContent { get }
    var isJobAppliedSuccessfully: Bool { get }

    func loadData(_ id: String)
    func applyForJob(_ id: String)
}
