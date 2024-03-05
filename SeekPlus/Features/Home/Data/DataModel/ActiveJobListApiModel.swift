//
//  ActiveJobListApiModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Apollo
import SeekPlusAPI
import ApolloAPI

struct ActiveJobListApiModel {
    let page: Int
    let size: Int
    let hasNext: Bool
    let total: Int
    let jobs: [JobApiModel]

    init(from graphQLObject: ActiveJobListQuery.Data.Active) {
        self.page = graphQLObject.page ?? 1
        self.size = graphQLObject.size ?? 19
        self.hasNext = graphQLObject.hasNext ?? false
        self.total = graphQLObject.total ?? 19

        var jobs: [JobApiModel] = []
        if let graphQlJobs = graphQLObject.jobs {
            for job in graphQlJobs {
                jobs.append(JobApiModel(from: job?.fragments.jobModel))
            }
        }
        self.jobs = jobs
    }

    init(page: Int, size: Int, hasNext: Bool, total: Int, jobs: [JobApiModel]) {
        self.page = page
        self.size = size
        self.hasNext = hasNext
        self.total = total
        self.jobs = jobs
    }
}
