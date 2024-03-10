//
//  MockActiveJobsData.swift
//  SeekPlusTests
//
//  Created by Shubham
//

@testable import SeekPlus

struct MockActiveJobsData {
    private static let salaryRange = SalaryRange(min: 10,
                                                 max: 100)

    static let job = JobApiModel(id: MockData.id,
                                 positionTitle: MockData.positionTitle,
                                 description: MockData.description,
                                 salaryRange: salaryRange,
                                 location: MockData.location,
                                 industry: MockData.industry,
                                 haveIApplied: MockData.applied)
    static let jobPagination = JobApiModel(id: MockData.id_1,
                                           positionTitle: MockData.positionTitle,
                                           description: MockData.description,
                                           salaryRange: salaryRange,
                                           location: MockData.location,
                                           industry: MockData.industry,
                                           haveIApplied: MockData.applied)

    static let activeJobListApiModel = ActiveJobListApiModel(page: MockData.page,
                                                             size: MockData.size,
                                                             hasNext: MockData.hasNextTrue,
                                                             total: MockData.total,
                                                             jobs: [job])

    static let activeJobListApiModelForPagination = ActiveJobListApiModel(page: MockData.page_2,
                                                                          size: MockData.size_5,
                                                                          hasNext: MockData.hasNextTrue,
                                                                          total: MockData.total_20,
                                                                          jobs: [job, jobPagination])
}
