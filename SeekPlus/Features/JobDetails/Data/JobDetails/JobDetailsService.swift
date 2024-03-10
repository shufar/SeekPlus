//
//  JobDetailsService.swift
//  SeekPlus
//
//  Created by Shubham
//

import Apollo
import Combine
import SeekPlusAPI

struct JobDetailsService: JobDetailsServiceContract {
    private let networkProvider: NetworkProviderContract

    init(networkProvider: NetworkProviderContract) {
        self.networkProvider = networkProvider
    }

    func getJobDetails(_ id: String) -> JobDetailsPublisher {
        return Future { promise in
            _ = networkProvider
                .fetch(query: JobDetailsQuery(jobId: id)) { result in
                    switch result {
                    case .success(let graphQLResult):
                        // check the `data` property
                        if let jobDetails = graphQLResult.data?.job {
                            let jobApiModel = JobApiModel(from: jobDetails.fragments.jobModel)
                            return promise(.success(jobApiModel))
                        }

                        if let errors = graphQLResult.errors {
                            print(errors)
                            //                            return promise(.failure(errors as! Error))
                        }

                    case .failure(let error):
                        print(error)
                        return promise(.failure(error))

                    }
                }
        }.eraseToAnyPublisher()
    }
}
