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
    var searchVC: SearchViewController? {get}
    func viewNeedsSecondScreen(presentingVC: UIViewController)
    func viewNeedsWordData(forSearchString searchString: String)
    var tableViewManager: SearchResultsTableViewManagerProtocol? {get}
}

protocol AnagramSolverPresenterInput: AnyObject {
    func suggestionsFetchSuccess(results: [WordLists])
}

final class AnagramSolverPresenter: AnagramSolverPresenterProtocol {
    func viewNeedsSecondScreen(presentingVC: UIViewController) {
        router?.presentSearchScreen(presentingVC: presentingVC, viewController: searchVC ?? UIViewController())

    }
    
    var router: AnagramSolverRouterProtocol?
    var tableViewManager: SearchResultsTableViewManagerProtocol?
     var searchVC: SearchViewController?
    var interactor: AnagramSolverInteractorProtocol?
    
    func viewNeedsWordData(forSearchString searchString: String) {
        interactor?.fetchAnagrams(with: searchString)
    }
    

}

extension AnagramSolverPresenter: AnagramSolverPresenterInput{
    func suggestionsFetchSuccess(results: [WordLists]) {
        tableViewManager?.setUpSearchresults(with: results)
    }
    
    
}
