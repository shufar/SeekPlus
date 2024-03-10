//
//  LoginService.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine
import Apollo
import SeekPlusAPI

struct LoginService: LoginServiceContract {
    private let networkProvider: NetworkProviderContract

    init(networkProvider: NetworkProviderContract) {
        self.networkProvider = networkProvider
    }

    func login(_ userName: String, _ password: String) -> LoginPublisher {
        return Future { promise in
            _ = networkProvider
                .perform(mutation: AuthUserMutation(username: userName,
                                                    password: password)) { result in
                    switch result {
                    case .success(let graphQLResult):
                        // check the `data` property
                        if let authUser = graphQLResult.data {
                            let authApiModel = AuthApiModel(from: authUser)

                            return promise(.success(authApiModel))
                        }

                        if let errors = graphQLResult.errors {
                            print(errors)
                        }

                    case .failure(let error):
                        print(error)
                        return promise(.failure(error))

                    }
                }
        }.eraseToAnyPublisher()
    }
}
