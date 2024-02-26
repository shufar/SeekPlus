//
//  HomeViewModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Foundation

protocol HomeViewModelContract: ObservableObject {
    var jobs: [JobApiModel] { get }

    func loadData()
}
