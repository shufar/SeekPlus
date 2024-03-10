//
//  MockGraphQLJobDetailsData.swift
//  SeekPlusTests
//
//  Created by Shubham
//

import Apollo
import ApolloTestSupport
import SeekPlusAPI
import SeekPlusAPITestMocks

struct MockGraphQLJobDetailsData {
    private static let jobDetailsQueryWithData = Mock<Query>(job: MockGraphQLActiveJobsData.job)

    static let jobDetailsQueryModelWithData = JobDetailsQuery.Data.from(jobDetailsQueryWithData)
}
