//
//  JobDetailContent.swift
//  SeekPlus
//
//  Created by Shubham
//

import Foundation

struct JobDetailsContent {
    let jobTitle: String
    let companyTitle: String
    let location: String
    let type: String
    let payRange: String
    let description: String
    let applied: Bool

    init(jobTitle: String,
         companyTitle: String,
         location: String,
         type: String,
         payRange: String,
         description: String,
         applied: Bool) {
        self.jobTitle = jobTitle
        self.companyTitle = companyTitle
        self.location = location
        self.type = type
        self.payRange = payRange
        self.description = description
        self.applied = applied
    }

    init(from jobApiModel: JobApiModel) {
        self.jobTitle = jobApiModel.positionTitle
        self.companyTitle = "SEEK Malaysia"
        self.location = JobDetailsContent.getLocation(jobApiModel.location)
        self.type = "Hybrid"
        self.payRange = JobDetailsContent.getPayRange(jobApiModel.salaryRange)
        self.description = jobApiModel.description
        self.applied = jobApiModel.haveIApplied
    }
}

private extension JobDetailsContent {
    static func getPayRange(_ salaryRange: SalaryRange) -> String {
        "MYR \(salaryRange.min) - MYR \(salaryRange.max)"
    }

    static func getLocation(_ location: Int) -> String {
        location == 0 ? "Kuala Lumpur, Malaysia" : "Melbourne, Australia"
    }
}

extension JobDetailsContent {
    static var `default`: JobDetailsContent {
        self.init(jobTitle: "JobTitle",
                  companyTitle: "CompanyTitle",
                  location: "Petaling Jaya, Selangor",
                  type: "Hybrid",
                  payRange: "MYR 10K - MYR 15K",
                  description: "Fancy multiline description about a very nice profile which contains overview about the job posting.\n\nFancy multiline description about a very nice profile which contains overview about the job posting.\n\nFancy multiline description about a very nice profile which contains overview about the job posting.\n\nFancy multiline description about a very nice profile which contains overview about the job posting.", // swiftlint:disable:this line_length
                  applied: false)
    }
}
