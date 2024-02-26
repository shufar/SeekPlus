//
//  Network.swift
//  SeekPlus
//
//  Created by Shubham
//

import Foundation
import Apollo

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
