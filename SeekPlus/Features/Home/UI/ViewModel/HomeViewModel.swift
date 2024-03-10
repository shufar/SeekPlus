//
//  HomeViewModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

final class HomeViewModel: HomeViewModelContract, ObservableObject {
    @Published var jobs: [JobApiModel] = []
    @Published var activityIndicator: ActivityIndicatorEvent = .hideIndicator

    private let homeInteractor: HomeInteractorContract

    private let limit = 5
    private var page = 1
    private var hasNextPage = true
    private var isLoadingMore = false
    private var disposeBag = Set<AnyCancellable>()

    init(_ interactor: HomeInteractorContract) {
        self.homeInteractor = interactor
    }

    func loadData() {
        self.activityIndicator = .showIndicator
        self.jobs = []
        self.page = 1

        self.homeInteractor.getActiveJobList(limit, page)
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

                self.jobs = jobListResponse.jobs
                self.hasNextPage = jobListResponse.hasNext
                self.activityIndicator = .hideIndicator
            }.store(in: &disposeBag)
    }

    func loadMoreData(currentItem job: JobApiModel) {
        guard self.hasNextPage,
              !self.isLoadingMore,
              self.isLastItem(job) else { return }

        self.activityIndicator = .showIndicator
        self.updatePaginationAttribtes()

        self.homeInteractor.getActiveJobList(limit, page)
            .sink { [weak self] completion in
                self?.activityIndicator = .hideIndicator
                self?.isLoadingMore = false

                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] jobListResponse in
                guard let self = self else { return }

                self.jobs += jobListResponse.jobs.filter { !self.jobs.contains($0) }
                self.hasNextPage = jobListResponse.hasNext
                self.activityIndicator = .hideIndicator
                self.isLoadingMore = false
            }.store(in: &disposeBag)
    }
}

private extension HomeViewModel {
    func isLastItem(_ item: JobApiModel) -> Bool {
        return self.jobs.last?.id == item.id
    }

    func updatePaginationAttribtes() {
        if self.hasNextPage {
            self.page += 1
            self.isLoadingMore = true
        }
    }
}
