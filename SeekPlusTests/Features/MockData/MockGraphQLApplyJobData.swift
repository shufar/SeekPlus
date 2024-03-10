//
//  MockGraphQLApplyJobData.swift
//  SeekPlusTests
//
//  Created by Shubh on 11/03/2024.
//

import Apollo
import ApolloTestSupport
import SeekPlusAPI
import SeekPlusAPITestMocks

struct MockGraphQLApplyJobData {
    static let applyForJob = true
    private static let applyJobMutation = Mock<Mutation>(apply: applyForJob)

    static let applyJobMutationModel = ApplyMutation.Data.from(applyJobMutation)
}
