//
//  JobDetialsViewModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

final class JobDetailsViewModel: JobDetailsViewModelContract {
    @Published var jobDetails: JobDetailsContent = .default
    @Published var isJobAppliedSuccessfully: Bool = false
    @Published var activityIndicator: ActivityIndicatorEvent = .hideIndicator

    private var disposeBag = Set<AnyCancellable>()
    private let jobDetailsInteractor: JobDetailsInteractorContract
    private let applyJobInteractor: ApplyJobInteractorContract

    init(_ jobDetialsInteractor: JobDetailsInteractorContract, _ applyJobInteractor: ApplyJobInteractorContract) {
        self.jobDetailsInteractor = jobDetialsInteractor
        self.applyJobInteractor = applyJobInteractor
    }

    func loadData(_ id: String) {
        activityIndicator = .showIndicator
        jobDetails = .default

        self.jobDetailsInteractor.getJobDetails(id)
            .sink { [weak self] completion in
                self?.activityIndicator = .hideIndicator

                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] jobDetails in
                guard let self = self else { return }

                self.jobDetails = JobDetailsContent(from: jobDetails)
                self.activityIndicator = .hideIndicator
            }.store(in: &disposeBag)
    }

    func applyForJob(_ id: String) {
        activityIndicator = .showIndicator

        self.applyJobInteractor.applyForJob(id)
            .sink { [weak self] completion in
                self?.activityIndicator = .hideIndicator
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] applyJob in
                guard let self = self else { return }

                self.isJobAppliedSuccessfully = applyJob.apply
                self.activityIndicator = .hideIndicator
            }.store(in: &disposeBag)

    }
}
