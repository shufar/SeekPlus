//
//  HomeInteractorContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

typealias ActiveJobListPublisher = AnyPublisher<ActiveJobListApiModel, Error>

protocol HomeInteractorContract {
    func getActiveJobList(_ limit: Int, _ page: Int) -> ActiveJobListPublisher
}
