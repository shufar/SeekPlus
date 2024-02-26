//
//  AuthApiModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Apollo
import SeekPlusAPI
import ApolloAPI

struct AuthApiModel {
    let auth: String

    init(auth: String) {
        self.auth = auth
    }

    init(from graphQLModel: AuthUserMutation.Data) {
        self.auth = graphQLModel.auth ?? ""
    }
}
