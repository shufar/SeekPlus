//
//  AppliedJobsViewModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

final class AppliedJobsViewModel: AppliedJobsViewModelContract {
    @Published var appliedJobs: [JobApiModel] = []
    @Published var activityIndicator: ActivityIndicatorEvent = .hideIndicator
    @Published var showPlaceholder: Bool = false

    private var disposeBag = Set<AnyCancellable>()
    private let homeInteractor: HomeInteractorContract

    init(_ interactor: HomeInteractorContract) {
        self.homeInteractor = interactor
    }

    func loadData() {
        activityIndicator = .showIndicator
        appliedJobs = []

        self.homeInteractor.getActiveJobList(20, 1)
            .sink { [weak self] completion in
                self?.activityIndicator = .hideIndicator

                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] jobListResponse in
                guard let self = self else { return }

                self.appliedJobs = jobListResponse.jobs.filter { $0.haveIApplied == true }
                self.activityIndicator = .hideIndicator

                if self.appliedJobs.isEmpty {
                    self.showPlaceholder = true
                } else {
                    self.showPlaceholder = false
                }
            }.store(in: &disposeBag)
    }
}
