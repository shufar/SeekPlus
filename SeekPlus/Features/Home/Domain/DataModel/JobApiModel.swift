//
//  JobApiModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Apollo
import SeekPlusAPI
import ApolloAPI

struct JobApiModel: Identifiable, Equatable {
    let id: String
    let positionTitle: String
    let description: String
    let salaryRange: SalaryRange
    let location: Int
    let industry: Int
    let haveIApplied: Bool

    init(from graphQLObject: JobModel?) {
        self.id = graphQLObject?._id ?? "DefaultJobId"
        self.positionTitle = graphQLObject?.positionTitle ?? "DefaultPosition"
        self.description = graphQLObject?.description ?? "DefaultDescription"
        self.salaryRange = SalaryRange(from: graphQLObject?.salaryRange?.fragments.salaryRangeModel)
        self.location = graphQLObject?.location ?? 0
        self.industry = graphQLObject?.industry ?? 1
        self.haveIApplied = graphQLObject?.haveIApplied ?? false
    }
}

// MARK: - Salary Range
struct SalaryRange: Hashable {
    let min: Int
    let max: Int

    init(from graphQLObject: SalaryRangeModel?) {
        self.min = graphQLObject?.min ?? 0
        self.max = graphQLObject?.max ?? 0
    }
}
