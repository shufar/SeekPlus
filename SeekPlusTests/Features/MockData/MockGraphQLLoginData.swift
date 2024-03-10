//
//  MockGraphQLLoginData.swift
//  SeekPlusTests
//
//  Created by Shubham
//

import Apollo
import ApolloTestSupport
import SeekPlusAPI
import SeekPlusAPITestMocks

struct MockGraphQLLoginData {
    static let authToken = "MockToken"
    private static let authUserMutation = Mock<Mutation>(auth: authToken)

    static let authUserMutationModel = AuthUserMutation.Data.from(authUserMutation)
}
