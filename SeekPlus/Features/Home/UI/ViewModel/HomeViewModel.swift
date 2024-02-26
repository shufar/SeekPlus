//
//  HomeViewModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

final class HomeViewModel: HomeViewModelContract {
    @Published var jobs: [JobApiModel] = []

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
                self.jobs = jobList
            }.store(in: &disposeBag)
    }
}
