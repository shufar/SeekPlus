//
//  ApplyJobService.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine
import Apollo
import SeekPlusAPI

struct ApplyJobService: ApplyJobServiceContract {
    private let networkProvider: NetworkProviderContract

    init(networkProvider: NetworkProviderContract) {
        self.networkProvider = networkProvider
    }

    func applyForJob(_ id: String) -> ApplyJobPublisher {
        return Future { promise in
            _ = networkProvider
                .perform(mutation: ApplyMutation(jobId: id)) { result in
                    switch result {
                    case .success(let graphQLResult):
                        // check the `data` property
                        if let applyJob = graphQLResult.data {
                            let applyJobApiModel = ApplyJobApiModel(from: applyJob)

                            return promise(.success(applyJobApiModel))
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
