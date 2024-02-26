//
//  AppliedJobsAssembly.swift
//  SeekPlus
//
//  Created by Shubham
//

import Swinject
import SwinjectAutoregistration

class AppliedJobsAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister((any AppliedJobsViewModelContract).self, initializer: AppliedJobsViewModel.init)
    }
}
