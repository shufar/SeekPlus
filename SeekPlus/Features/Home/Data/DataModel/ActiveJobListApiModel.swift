//
//  ActiveJobListApiModel.swift
//  SeekPlus
//
//  Created by Shubham
//

struct ActiveJobListApiModel {
    let page: Int
    let size: Int
    let hasNext: Bool
    let total: Int
    let jobs: [JobApiModel]
}
