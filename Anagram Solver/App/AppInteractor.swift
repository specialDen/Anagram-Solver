//
//  AppInteractor.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 05.02.2023.
//

import UIKit

protocol AppInteractorProtocol {
    func setInitialScreen()
}

final class AppInteractor: AppInteractorProtocol {
    private var coordinator: AppCoordinatorProtocol?
    private weak var windowScene: UIWindowScene!
    
    init(windowScene: UIWindowScene) {
        self.windowScene = windowScene
        self.coordinator = AppCoordinator()
        self.setInitialScreen()
    }
    
    
    func setInitialScreen() {
        // check if user is registered ? register_screen_Init : homeScreen
        coordinator?.createHomePages(scene: windowScene)
    }
}
