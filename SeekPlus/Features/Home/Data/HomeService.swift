//
//  HomeService.swift
//  SeekPlus
//
//  Created by Shubham
//

import Apollo
import Combine
import SeekPlusAPI

struct HomeService: HomeServiceContract {
    private let networkProvider: NetworkProviderContract

    init(networkProvider: NetworkProviderContract) {
        self.networkProvider = networkProvider
    }

    func getActiveJobList(_ limit: Int, _ page: Int) -> ActiveJobListPublisher {
        return Future { promise in
            _ = networkProvider
                .fetch(query: ActiveJobListQuery(limit: GraphQLNullable<Int>(integerLiteral: limit),
                                                 page: GraphQLNullable<Int>(integerLiteral: page))) { result in
                    switch result {
                    case .success(let graphQLResult):
                        // check the `data` property
                        if let activeJobListResponse = graphQLResult.data?.active {
                            //                            var jobList: [JobApiModel] = []
                            //                            for job in activeJobList {
                            //                                jobList.append(JobApiModel(from: job?.fragments.jobModel))
                            //                            }
                            let jobListResponse = ActiveJobListApiModel(from: activeJobListResponse)
                            return promise(.success(jobListResponse))
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
