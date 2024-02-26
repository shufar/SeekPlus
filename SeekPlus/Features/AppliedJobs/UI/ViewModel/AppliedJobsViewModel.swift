//
//  AppliedJobsViewModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

final class AppliedJobsViewModel: AppliedJobsViewModelContract {
    @Published var appliedJobs: [JobApiModel] = []

    private var disposeBag = Set<AnyCancellable>()
    private let homeInteractor: HomeInteractorContract

    init(_ interactor: HomeInteractorContract) {
        self.homeInteractor = interactor
    }

    func loadData() {
        self.homeInteractor.getActiveJobList()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { jobList in
                self.appliedJobs = jobList.filter { $0.haveIApplied == true }
            }.store(in: &disposeBag)
    }
}
