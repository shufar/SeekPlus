//
//  TokenInspector.swift
//  SeekPlus
//
//  Created by Shubham
//

import Apollo
import ApolloAPI
import Foundation

class TokenInterceptor: ApolloInterceptor {
    // Any custom interceptors you use are required to be able to identify themselves through an id property.
    var id: String = UUID().uuidString
    let token: String

    init(token: String) {
        self.token = token
    }

    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void)
    where Operation : ApolloAPI.GraphQLOperation {
        request.addHeader(name: "Authorization",
                          value: "Bearer \(token)")

        debugPrint(request.additionalHeaders)

        chain.proceedAsync(request: request,
                           response: response,
                           interceptor: self,
                           completion: completion)
    }
}
