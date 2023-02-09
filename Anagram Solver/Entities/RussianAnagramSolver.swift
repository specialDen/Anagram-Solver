//
//  RussianAnagramSolver.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 08.02.2023.
//

import Foundation


struct RussianAnagramSolver {
    
    var wordsDict: [String : [Int : [String]]] = [:]
    
    init() {
        wordsDict = getWordDict()
//        findAnagrams(of : "братан")
    }
    
    func findAnagrams(of searchString: String) -> [String] {
        var anagrams: [String] = []
        let searchString = searchString.lowercased()
        var set = Set<Character>()
        let uniqueSearchString = searchString.filter{ set.insert($0).inserted }
        
        uniqueSearchString.forEach { letter in
            let str = String(letter)
            let words = wordsDict[str]
            
            for length in 1..<searchString.count {
                guard let searchArray = words?[length] else {continue}
                let lookUpResults = lookUp(lookUpString: searchString, searchArray: searchArray ?? [])
                if !lookUpResults.isEmpty {
                    anagrams.append(contentsOf: lookUpResults)
                }
            }
        }
        return anagrams
    }
    
    private func lookUp (lookUpString:String, searchArray:[String]) ->[String] {
        var returnArray:[String] = []
        searchArray.forEach { word in
            if lookUpString.unorderedContains(string: word) {
                returnArray.append(word)
            }
        }
        return returnArray
    }
    
    private func getWordDict() -> [String : [Int : [String]]] {
        var wordsDict: [String : [Int : [String]]] = [:]
        var textArr = readFile(inputFile: "myJsonDict.json")
        textArr = textArr.map { str in
            str.lowercased()
        }
        let wordsByalphabets = Dictionary(grouping: textArr, by: {$0.first})
        wordsByalphabets.forEach { word in
            let key: String = String(word.key!)
            let wordsByLength = Dictionary(grouping: word.value, by: {$0.count})
            wordsDict[key] = wordsByLength
        }

        return wordsDict
    }
    
    func readFile(inputFile: String) -> [String] {
        let fileExtension = inputFile.fileExtension()
        let fileName = inputFile.fileName()

        guard let inputFile = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            fatalError("Couldn't find \(fileName) in main bundle.")
        }

        guard let data = try? Data(contentsOf: inputFile) else {
            fatalError("Could not load \(inputFile) in the project!")
        }
        
        let decoder = JSONDecoder ()
        guard let loadedData = try? decoder.decode ([String].self, from: data) else {
            fatalError ("Could not decode \(inputFile) in the project!")}
        
        return loadedData
    }
    
    


}
