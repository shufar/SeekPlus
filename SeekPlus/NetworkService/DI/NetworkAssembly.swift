//
//  NetworkAssembly.swift
//  SeekPlus
//
//  Created by Shubham
//

import Swinject
import SwinjectAutoregistration

class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(NetworkProviderContract.self, initializer: NetworkProvider.init)
    }
}
