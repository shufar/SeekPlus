//
//  JobCardContent.swift
//  SeekPlus
//
//  Created by Shubham
//

struct JobCardContent: Hashable {
    let jobTitle: String
    let companyTitle: String
    let description: String
    let applied: Bool

    init(jobTitle: String, companyTitle: String, description: String, applied: Bool) {
        self.jobTitle = jobTitle
        self.companyTitle = companyTitle
        self.description = description
        self.applied = applied
    }

    init(from jobApiModel: JobApiModel) {
        self.jobTitle = jobApiModel.positionTitle
        self.companyTitle = "Seek Malaysia"
        self.description = jobApiModel.description
        self.applied = jobApiModel.haveIApplied
    }
}
