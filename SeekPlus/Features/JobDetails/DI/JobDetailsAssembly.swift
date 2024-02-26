//
//  JobDetialsAssembly.swift
//  SeekPlus
//
//  Created by Shubham
//

import Swinject
import SwinjectAutoregistration

class JobDetailsAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister((any JobDetailsViewModelContract).self, initializer: JobDetailsViewModel.init)
        container.autoregister((any JobDetailsInteractorContract).self, initializer: JobDetailsInteractor.init)
        container.autoregister((any JobDetailsServiceContract).self, initializer: JobDetailsService.init)

        container.autoregister((any ApplyJobInteractorContract).self, initializer: ApplyJobInteractor.init)
        container.autoregister((any ApplyJobServiceContract).self, initializer: ApplyJobService.init)
    }
}
