//
//  AppDelegate.swift
//  SeekPlus
//
//  Created by Shubham
//

import Foundation
import SwiftUI
import Swinject

class AppDelegate: NSObject, UIApplicationDelegate {
    static let baseContainer: Container = {
        let container = Container()
        return container
    }()

    static let baseAssebler: Assembler = Assembler([LoginAssembly()], container: baseContainer)

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
