//
//  JobDetailsInteractorContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

typealias JobDetailsPublisher = AnyPublisher<JobApiModel, Error>

protocol JobDetailsInteractorContract {
    func getJobDetails(_ id: String) -> JobDetailsPublisher
}
