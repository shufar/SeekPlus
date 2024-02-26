//
//  ApplyJobInteractorContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

typealias ApplyJobPublisher = AnyPublisher<ApplyJobApiModel, Error>

protocol ApplyJobInteractorContract {
    func applyForJob(_ id: String) -> ApplyJobPublisher
}
