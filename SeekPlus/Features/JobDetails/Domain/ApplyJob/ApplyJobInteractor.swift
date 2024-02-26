//
//  ApplyJobInteractor.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

struct ApplyJobInteractor: ApplyJobInteractorContract {
    private let applyJobService: ApplyJobServiceContract

    init(applyJobService: ApplyJobServiceContract) {
        self.applyJobService = applyJobService
    }

    func applyForJob(_ id: String) -> ApplyJobPublisher {
        self.applyJobService.applyForJob(id)
    }
}
