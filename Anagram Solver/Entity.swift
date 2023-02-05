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
        }
    }
}
