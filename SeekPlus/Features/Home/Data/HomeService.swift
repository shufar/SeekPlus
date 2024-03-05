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
    func getActiveJobList(_ limit: Int, _ page: Int) -> ActiveJobListPublisher {
        return Future { promise in
            Network.shared
                .apollo
                .fetch(query: ActiveJobListQuery(limit: GraphQLNullable<Int>(integerLiteral: limit),
                                                 page: GraphQLNullable<Int>(integerLiteral: page)),
                       cachePolicy: .fetchIgnoringCacheCompletely) { result in
                    switch result {
                    case .success(let graphQLResult):
                        // check the `data` property
                        if let activeJobList = graphQLResult.data?.active?.jobs {
                            var jobList: [JobApiModel] = []
                            for job in activeJobList {
                                jobList.append(JobApiModel(from: job?.fragments.jobModel))
                            }

                            return promise(.success(jobList))
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
