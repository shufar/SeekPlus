//
//  LoginInteractor.swift
//  SeekPlus
//
//  Created by Shubham
//

struct LoginInteractor: LoginInteractorContract {
    private let loginService: LoginServiceContract

    init(loginService: LoginServiceContract) {
        self.loginService = loginService
    }

    func login(_ userName: String, _ password: String) -> LoginPublisher {
        self.loginService.login(userName, password)
    }
}
