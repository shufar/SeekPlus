//
//  LoginAssembly.swift
//  SeekPlus
//
//  Created by Shubham
//

import Swinject
import SwinjectAutoregistration

class LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(LoginServiceContract.self, initializer: LoginService.init)
        container.autoregister(LoginInteractorContract.self, initializer: LoginInteractor.init)
        container.autoregister((any LoginViewModelContract).self, initializer: LoginViewModel.init)
    }
}
