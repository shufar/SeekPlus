//
//  ApplyJob.swift
//  SeekPlus
//
//  Created by Shubham
//

import Apollo
import SeekPlusAPI
import ApolloAPI

struct ApplyJobApiModel {
    let apply: Bool

    init(apply: Bool) {
        self.apply = apply
    }

    init(from graphQLModel: ApplyMutation.Data) {
        self.apply = graphQLModel.apply ?? false
    }
}
