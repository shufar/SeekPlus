//
//  LoginViewModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine
import Foundation

final class LoginViewModel: LoginViewModelContract {
    @Published var isTokenSavedSuccessfully: Bool = false

    private var disposeBag = Set<AnyCancellable>()
    private let loginInteractor: LoginInteractorContract

    init(loginInteractor: LoginInteractorContract) {
        self.loginInteractor = loginInteractor
    }

    func login(_ userName: String, _ password: String) {
        self.loginInteractor.login(userName, password)
            .sink { completion in
                switch completion {
                case .finished:
                    debugPrint("Finished")
                case .failure(let error):
                    debugPrint(error)
                }
            } receiveValue: { authModel in
                let authToken = authModel.auth

                debugPrint(authToken)
                let data = Data(authToken.utf8)
                KeychainHelper.standard.save(data, service: AuthKeys.service, account: AuthKeys.account)

                if !authToken.isEmpty {
                    self.isTokenSavedSuccessfully = true
                }
            }.store(in: &disposeBag)
    }
}
