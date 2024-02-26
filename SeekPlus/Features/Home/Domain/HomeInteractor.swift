//
//  HomeInteractor.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

struct HomeInteractor: HomeInteractorContract {
    private let homeService: HomeServiceContract

    init(homeService: HomeServiceContract) {
        self.homeService = homeService
    }

    func getActiveJobList() -> ActiveJobListPublisher {
        self.homeService.getActiveJobList(20, 1)
    }
}
