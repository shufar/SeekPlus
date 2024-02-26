//
//  LoginInteractor.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

typealias LoginPublisher = AnyPublisher<AuthApiModel, Error>

protocol LoginInteractorContract {
    func login(_ userName: String, _ password: String) -> LoginPublisher
}
