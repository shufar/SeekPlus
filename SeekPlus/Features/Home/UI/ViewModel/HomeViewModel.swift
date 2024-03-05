//
//  HomeViewModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

final class HomeViewModel: HomeViewModelContract {
    @Published var jobs: [JobApiModel] = []
    @Published var activityIndicator: ActivityIndicatorEvent = .hideIndicator

    private var disposeBag = Set<AnyCancellable>()
    private let homeInteractor: HomeInteractorContract

    init(_ interactor: HomeInteractorContract) {
        self.homeInteractor = interactor
    }

    func loadData() {
        self.activityIndicator = .showIndicator
        self.jobs = []

        self.homeInteractor.getActiveJobList()
            .sink { [weak self] completion in
                self?.activityIndicator = .hideIndicator

                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] jobList in
                guard let self = self else { return }

                self.jobs = jobList
                self.activityIndicator = .hideIndicator
            }.store(in: &disposeBag)
    }
}
