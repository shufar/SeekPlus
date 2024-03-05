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

    func getActiveJobList(_ limit: Int, _ page: Int) -> ActiveJobListPublisher {
        self.homeService.getActiveJobList(limit, page)
    }
}
