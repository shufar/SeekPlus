//
//  HomeInteractorContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

typealias ActiveJobListPublisher = AnyPublisher<[JobApiModel], Error>

protocol HomeInteractorContract {
    func getActiveJobList() -> ActiveJobListPublisher
}
