//
//  HomeServiceContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

protocol HomeServiceContract {
    func getActiveJobList(_ limit: Int, _ page: Int) -> ActiveJobListPublisher
}
