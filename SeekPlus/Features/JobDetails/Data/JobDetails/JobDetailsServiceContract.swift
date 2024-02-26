//
//  JobDetailsServiceContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

protocol JobDetailsServiceContract {
    func getJobDetails(_ id: String) -> JobDetailsPublisher
}
