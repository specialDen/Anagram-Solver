//
//  AnagramSolverRouter.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 05.02.2023.
//

import UIKit

protocol AnagramSolverRouterProtocol{
    func presentSearchScreen(presentingVC: UIViewController, language: LanguagesEnum)
}

final class AnagramSolverRouter: AnagramSolverRouterProtocol{
    
    func presentSearchScreen(presentingVC: UIViewController, language: LanguagesEnum) {
        let searchVC = AnagramAssembly.createSearchScreen(withLanguage: language)
        searchVC.modalPresentationStyle = .fullScreen
        
        presentingVC.present(searchVC, animated: true)
    }
}
