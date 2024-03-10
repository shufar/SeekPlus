//
//  Network.swift
//  SeekPlus
//
//  Created by Shubham
//

import Apollo
import ApolloAPI
import Foundation

class Network {
    static let shared = Network()

    private init() {}

    private(set) lazy var apollo: ApolloClient = {
        let endpointURL = URL(string: "http://localhost:3002/")!
        let store = ApolloStore()

        let interceptorProvider = NetworkInterceptorsProvider(
            interceptors: [TokenInterceptor(token: getTokenFromKeychain())],
            store: store
        )

        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: interceptorProvider, endpointURL: endpointURL
        )

        return ApolloClient(networkTransport: networkTransport, store: store)
    }()

    private func getTokenFromKeychain() -> String {
        guard let data = KeychainHelper.standard.read(service: AuthKeys.service, account: AuthKeys.account),
              let accessToken = String(data: data, encoding: .utf8) else { return "" }

        return accessToken
    }
}

struct NetworkProvider: NetworkProviderContract {
    private let networkProvider = Network.shared.apollo

    func fetch<Query: GraphQLQuery>(query: Query,
                                    resultHandler: Apollo.GraphQLResultHandler<Query.Data>?) -> Apollo.Cancellable? {
        networkProvider.fetch(query: query,
                              cachePolicy: .fetchIgnoringCacheCompletely,
                              resultHandler: resultHandler)
    }

    func perform<Mutation: GraphQLMutation>(mutation: Mutation,
                                            resultHandler:
                                            Apollo.GraphQLResultHandler<Mutation.Data>?) -> Apollo.Cancellable? {
        networkProvider.perform(mutation: mutation,
                                resultHandler: resultHandler)
    }
}
