//
//  Assembly.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 05.02.2023.
//

import UIKit

struct AnagramAssembly {
    static func createHomePage()-> UIViewController {
        let homePageVC = ViewController()
        let presenter = AnagramSolverPresenter()
        let router = AnagramSolverRouter()
        
        homePageVC.presenter = presenter
        
        presenter.router = router

        return homePageVC
    }
    
    static func createSearchScreen(withLanguage language: LanguagesEnum)-> UIViewController {
        let interactor = AnagramSolverInteractor()
        let apiManager = NetworkService<AnagramSolverEndPoint>()
        let presenter = AnagramSolverPresenter()
        let router = AnagramSolverRouter()
        let searchVC = SearchViewController()
        let tableviewManager = SearchResultsTableViewManager()
        
        
        interactor.apiManager = apiManager
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
//        presenter.searchVC = searchVC
        presenter.tableViewManager = tableviewManager
        
        searchVC.presenter = presenter
        searchVC.language = language
        
        return searchVC
    }
}
