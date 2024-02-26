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

    private var disposeBag = Set<AnyCancellable>()
    private let jobDetailsInteractor: JobDetailsInteractorContract
    private let applyJobInteractor: ApplyJobInteractorContract

    init(_ jobDetialsInteractor: JobDetailsInteractorContract, _ applyJobInteractor: ApplyJobInteractorContract) {
        self.jobDetailsInteractor = jobDetialsInteractor
        self.applyJobInteractor = applyJobInteractor
    }

    func loadData(_ id: String) {
        self.jobDetailsInteractor.getJobDetails(id)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { jobDetails in
                self.jobDetails = JobDetailsContent(from: jobDetails)
            }.store(in: &disposeBag)
    }

    func applyForJob(_ id: String) {
        self.applyJobInteractor.applyForJob(id)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { applyJob in
                self.isJobAppliedSuccessfully = applyJob.apply
            }.store(in: &disposeBag)

    }
}
