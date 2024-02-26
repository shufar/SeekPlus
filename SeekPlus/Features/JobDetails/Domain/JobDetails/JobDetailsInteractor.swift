//
//  JobDetailsInteractor.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

struct JobDetailsInteractor: JobDetailsInteractorContract {
    private let jobDetailsService: JobDetailsServiceContract

    init(jobDetailsService: JobDetailsServiceContract) {
        self.jobDetailsService = jobDetailsService
    }

    func getJobDetails(_ id: String) -> JobDetailsPublisher {
        self.jobDetailsService.getJobDetails(id)
    }
}
