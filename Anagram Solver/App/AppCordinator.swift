//
//  AppCordinator.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 05.02.2023.
//

import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    func createLandingPage(scene: UIWindowScene)
    func createHomePages(scene: UIWindowScene)
}

final class AppCoordinator {
    var window: UIWindow?
}

extension AppCoordinator: AppCoordinatorProtocol {
    func createLandingPage(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
//        window?.rootViewController = signup
        window?.makeKeyAndVisible()
    }
    
    func createHomePages(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        window?.rootViewController = AnagramAssembly.createHomePage()
        window?.makeKeyAndVisible()
    }
    
    
}
