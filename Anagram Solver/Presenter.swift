//
//  Presenter.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 05.02.2023.
//

import UIKit

protocol AnagramSolverPresenterProtocol: AnyObject{
    var interactor: AnagramSolverInteractorProtocol?{get}
    var router: AnagramSolverRouterProtocol? { get }
//    var searchVC: SearchViewController? {get}
    func viewNeedsSecondScreen(presentingVC: UIViewController, language: LanguagesEnum)
    func viewNeedsWordData(forSearchString searchString: String, language: LanguagesEnum)
    var tableViewManager: SearchResultsTableViewManagerProtocol? {get}
}

protocol AnagramSolverPresenterInput: AnyObject {
    func suggestionsFetchSuccess(results: [WordLists])
}

final class AnagramSolverPresenter: AnagramSolverPresenterProtocol {
    func viewNeedsSecondScreen(presentingVC: UIViewController, language: LanguagesEnum) {
        self.language = language
        router?.presentSearchScreen(presentingVC: presentingVC, language: language)

    }
    
    var language: LanguagesEnum = .english
    var router: AnagramSolverRouterProtocol?
    var tableViewManager: SearchResultsTableViewManagerProtocol?
//     var searchVC: SearchViewController?
    var interactor: AnagramSolverInteractorProtocol?
    
    func viewNeedsWordData(forSearchString searchString: String, language: LanguagesEnum) {
        self.language = language
        interactor?.fetchAnagrams(with: searchString, language: language)
    }
    

}

extension AnagramSolverPresenter: AnagramSolverPresenterInput{
    func suggestionsFetchSuccess(results: [WordLists]) {
        tableViewManager?.setUpSearchresults(with: results)
    }
    
    
}
