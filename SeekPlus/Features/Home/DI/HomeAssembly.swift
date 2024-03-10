//
//  HomeAssembly.swift
//  SeekPlus
//
//  Created by Shubham
//

import Swinject
import SwinjectAutoregistration

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(HomeServiceContract.self, initializer: HomeService.init)
        container.autoregister(HomeInteractorContract.self, initializer: HomeInteractor.init)
        container.autoregister(HomeViewModelContract.self, initializer: HomeViewModel.init)
    }
}
