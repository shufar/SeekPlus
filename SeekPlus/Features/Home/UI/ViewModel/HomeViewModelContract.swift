//
//  HomeViewModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Foundation

protocol HomeViewModelContract: ObservableObject {
    var jobs: [JobApiModel] { get }
    var activityIndicator: ActivityIndicatorEvent { get }

    func loadData()
    func loadMoreData(currentItem job: JobApiModel)
}
