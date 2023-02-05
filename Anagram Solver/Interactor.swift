//
//  Interactor.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 05.02.2023.
//

import Foundation

protocol AnagramSolverInteractorProtocol{
//    var pres
    func fetchAnagrams(with searchword: String)
}
final class AnagramSolverInteractor: AnagramSolverInteractorProtocol{
    var apiManager: NetworkService<AnagramSolverEndPoint>?
    weak var presenter: AnagramSolverPresenterInput?
    
    func fetchAnagrams(with searchword: String) {
        apiManager?.networkRequest(from: .getAllAnagrams(searchFilter: searchword), modelType: SearchResults.self, completion: { [weak self] result in
            switch result {
            case .success(let wordList):
                self?.interpretWordData(rawData: wordList, maxWordLength: searchword.count)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    private func interpretWordData(rawData: SearchResults, maxWordLength: Int) {
//        [WordLists]
        var wordLists: [WordLists] = []
        let wordsByLength = Dictionary(grouping: rawData.all, by: {$0.count})
        let sortedwordsByLength = wordsByLength.sorted { first, second in
            first.key > second.key
        }
        sortedwordsByLength.forEach { wordDict in
            let description = getLengthDescription(forWordLength: wordDict.key)
            let tempList = WordLists(words: wordDict.value, description: description)
            wordLists.append(tempList)
        }
        
        presenter?.suggestionsFetchSuccess(results: wordLists)
        
    }
    
    
    private func getLengthDescription(forWordLength length: Int) -> String {
        let word = Words(rawValue: length)
        return word?.description ?? ""
    }
}
