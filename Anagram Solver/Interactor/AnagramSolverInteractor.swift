//
//  AnagramSolverInteractor.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 05.02.2023.
//

import Foundation

protocol AnagramSolverInteractorProtocol{
//    var pres
    func fetchAnagrams(with searchword: String, language: LanguagesEnum)
//    func fetch
}
final class AnagramSolverInteractor: AnagramSolverInteractorProtocol{
    var apiManager: NetworkService<AnagramSolverEndPoint>?
    weak var presenter: AnagramSolverPresenterInput?
    var anagramSolver: AnagramSolverBrain?
    var language: LanguagesEnum = .english
    
    func fetchAnagrams(with searchword: String, language: LanguagesEnum) {
        self.language = language
        switch language {
        case .english:
            requestEnglishAnagrams(with: searchword)
        default:
            requestOtherAnagrams(with: searchword)
        }

    }
    
    private func interpretWordData(rawData: SearchResults) {
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
        return word?.getDescription(language: language) ?? ""
    }
    
    
    
    private func requestEnglishAnagrams(with searchword: String){
        apiManager?.networkRequest(from: .getAllAnagrams(searchFilter: searchword), modelType: SearchResults.self, completion: { [weak self] result in
            switch result {
            case .success(let wordList):
                self?.interpretWordData(rawData: wordList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    private func requestOtherAnagrams(with searchword: String){
        anagramSolver = AnagramSolverBrain(language: language)
        guard let anagramsList = anagramSolver?.findAnagrams(of: searchword) else {return}
        
        interpretWordData(rawData: SearchResults(all: anagramsList))
    }
}
