//
//  LoginServiceContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

protocol LoginServiceContract {
    func login(_ userName: String, _ password: String) -> LoginPublisher
}
