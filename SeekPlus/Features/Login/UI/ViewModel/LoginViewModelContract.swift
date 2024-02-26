//
//  LoginViewModelContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Combine

protocol LoginViewModelContract: ObservableObject {
    var isTokenSavedSuccessfully: Bool { get }
    func login(_ userName: String, _ password: String)
}
