//
//  MockApplyJobData.swift
//  SeekPlusTests
//
//  Created by Shubham
//

@testable import SeekPlus

struct MockApplyJobData {
    static let applyJobApiModel =
    ApplyJobApiModel(apply: MockGraphQLApplyJobData.applyForJob)

}
