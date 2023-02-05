//
//  AnagramSolverRouter.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 05.02.2023.
//

import UIKit

protocol AnagramSolverRouterProtocol{
    func presentSearchScreen(presentingVC: UIViewController, viewController: UIViewController)
}

final class AnagramSolverRouter: AnagramSolverRouterProtocol{
    
    func presentSearchScreen(presentingVC: UIViewController, viewController: UIViewController) {
        let searchVC = AnagramAssembly.createSearchScreen()
        searchVC.modalPresentationStyle = .fullScreen
        
        presentingVC.present(searchVC, animated: true)
    }
}
