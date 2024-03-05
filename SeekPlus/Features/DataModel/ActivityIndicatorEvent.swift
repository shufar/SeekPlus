//
//  ActivityIndicatorEvent.swift
//  SeekPlus
//
//  Created by Shubham
//

enum ActivityIndicatorEvent {
    case showIndicator
    case hideIndicator

    var value: Bool {
        switch self {
        case .showIndicator:
            true
        case .hideIndicator:
            false
        }
    }
}
