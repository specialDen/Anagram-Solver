//
//  Entity.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 04.02.2023.
//

import Foundation

struct SearchResults: Codable {
    let all: [String]
}

struct WordLists {
    var words: [String]
    let description: String
}

enum Words: Int{
    case oneLetterWord = 1
    case twoLetterWord = 2
    case threeLetterWord
    case fourLetterWord
    case fiveLetterWord
    case sixLetterWord
    case sevenLetterWord
    case eightLetterWord
    case nineLetterWord
    case tenLetterWord
    
    var description: String {
        switch self {
        case .oneLetterWord:
            return "ONE LETTER WORDS"
        case .twoLetterWord:
            return "TWO LETTER WORDS"
        case .threeLetterWord:
            return "THREE LETTER WORDS"
        case .fourLetterWord:
            return "FOUR LETTER WORDS"
        case .fiveLetterWord:
            return "FIVE LETTER WORDS"
        case .sixLetterWord:
            return "SIX LETTER WORDS"
        case .sevenLetterWord:
            return "SEVEN LETTER WORDS"
        case .eightLetterWord:
            return "EIGHT LETTER WORDS"
        case .nineLetterWord:
            return "NINE LETTER WORDS"
        case .tenLetterWord:
            return "TEN LETTER WORDS"
        }
        
    }
    
    var descriptionRus: String {
        switch self {
        case .oneLetterWord:
            return "СЛОВА ИЗ ОДНОЙ БУКВЫ"
        case .twoLetterWord:
            return "СЛОВА ИЗ ДВУХ БУКВ"
        case .threeLetterWord:
            return "СЛОВА ИЗ ТРЕХ БУКВ"
        case .fourLetterWord:
            return "СЛОВА ИЗ ЧЕТЫРЕХ БУКВ"
        case .fiveLetterWord:
            return "СЛОВА ИЗ ПЯТИ БУКВ"
        case .sixLetterWord:
            return "СЛОВА ИЗ ШЕСТИ БУКВ"
        case .sevenLetterWord:
            return "СЛОВА ИЗ СЕМИ БУКВ"
        case .eightLetterWord:
            return "СЛОВА ИЗ ВОСЬМИ БУКВ"
        case .nineLetterWord:
            return "СЛОВА ИЗ ДЕВЯТИ БУКВ"
        case .tenLetterWord:
            return "СЛОВА ИЗ ДЕСЯТИ БУКВ"
        }
        
    }
}


enum LanguagesEnum {
    case english
    case russian
    case german
    case french
    case italian
    case spanish
    
    var parameters: LanguageButtonModel {
        
        switch self {
        case .english:
            return LanguageButtonModel(imageName: "britain.flag", titleString: "EN")
        case .russian:
            return LanguageButtonModel(imageName: "russia.flag", titleString: "RU")
        case .german:
            return LanguageButtonModel(imageName: "germany.flag", titleString: "DE")
        case .french:
            return LanguageButtonModel(imageName: "france.flag", titleString: "FR")
        case .italian:
            return LanguageButtonModel(imageName: "italy.flag", titleString: "IT")
        case .spanish:
            return LanguageButtonModel(imageName: "spain.flag", titleString: "ES")
        }
    }
    
    var homeVCString: String {
        
        switch self {
        case .english:
            return "Tap to search"
        case .russian:
            return "Нажмите для поиска"
        case .german:
            return "Tippen Sie auf, um zu suchen"
        case .french:
            return "Appuyez pour rechercher"
        case .italian:
            return "Tocca per cercare"
        case .spanish:
            return "Toque para buscar"
        }
    }
    
}
