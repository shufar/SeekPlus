//
//  NetworkProviderContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Apollo
import ApolloAPI

protocol NetworkProviderContract {
    func fetch<Query: GraphQLQuery>(query: Query,
                                    resultHandler: GraphQLResultHandler<Query.Data>?) -> Apollo.Cancellable?
    func perform<Mutation: GraphQLMutation>(mutation: Mutation,
                                            resultHandler: GraphQLResultHandler<Mutation.Data>?) -> Apollo.Cancellable?
}
