//
//  ApplyJobServiceContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

protocol ApplyJobServiceContract {
    func applyForJob(_ id: String) -> ApplyJobPublisher
}
