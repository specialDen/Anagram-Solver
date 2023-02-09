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
    
    func getDescription(language: LanguagesEnum)->String {
        switch language {
        case .english:
            return descriptionENG
        case .russian:
            return descriptionRUS
        case .german:
            return descriptionGER
        case .french:
            return descriptionFR
        case .italian:
            return descriptionITA
        case .spanish:
            return descriptionESP
        }
    }
    
    private var descriptionENG: String {
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
    
    private var descriptionRUS: String {
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
    
    private var descriptionESP: String {
        switch self {
        case .oneLetterWord:
            return "PALABRAS DE UNA LETRA"
        case .twoLetterWord:
            return "PALABRAS DE DOS LETRAS"
        case .threeLetterWord:
            return "PALABRAS DE TRES LETRAS"
        case .fourLetterWord:
            return "PALABRAS DE CUATRO LETRAS"
        case .fiveLetterWord:
            return "PALABRAS DE CINCO LETRAS"
        case .sixLetterWord:
            return "PALABRAS DE SEIS LETRAS"
        case .sevenLetterWord:
            return "PALABRAS DE SIETE LETRAS"
        case .eightLetterWord:
            return "PALABRAS DE OCHO LETRAS"
        case .nineLetterWord:
            return "PALABRAS DE NUEVE LETRAS"
        case .tenLetterWord:
            return "PALABRAS DE DIEZ LETRAS"
        }
    }
    
    private var descriptionFR: String {
        switch self {
        case .oneLetterWord:
            return "MOTS D'UNE LETTRE"
        case .twoLetterWord:
            return "MOTS DE DEUX LETTRES"
        case .threeLetterWord:
            return "MOTS DE TROIS LETTRES"
        case .fourLetterWord:
            return "MOTS DE QUATRE LETTRES"
        case .fiveLetterWord:
            return "MOTS DE CINQ LETTRES"
        case .sixLetterWord:
            return "MOTS DE SIX LETTRES"
        case .sevenLetterWord:
            return "MOTS DE SEPT LETTRES"
        case .eightLetterWord:
            return "MOTS DE HUIT LETTRES"
        case .nineLetterWord:
            return "MOTS DE NEUF LETTRES"
        case .tenLetterWord:
            return "MOTS DE DIX LETTRES"
        }
    }
    
    private var descriptionGER: String {
        switch self {
        case .oneLetterWord:
            return "WÖRTER MIT EINEM BUCHSTABEN"
        case .twoLetterWord:
            return "WÖRTER MIT ZWEI BUCHSTABEN"
        case .threeLetterWord:
            return "WÖRTER MIT DREI BUCHSTABEN"
        case .fourLetterWord:
            return "WÖRTER MIT VIER BUCHSTABEN"
        case .fiveLetterWord:
            return "WÖRTER MIT FÜNF BUCHSTABEN"
        case .sixLetterWord:
            return "WÖRTER MIT SECHS BUCHSTABEN"
        case .sevenLetterWord:
            return "WÖRTER MIT SIEBEN BUCHSTABEN"
        case .eightLetterWord:
            return "WÖRTER MIT ACHT BUCHSTABEN"
        case .nineLetterWord:
            return "WÖRTER MIT NEUN BUCHSTABEN"
        case .tenLetterWord:
            return "WÖRTER MIT ZEHN BUCHSTABEN"
        }
    }
    private var descriptionITA: String {
        switch self {
        case .oneLetterWord:
            return "PAROLE DI UNA LETTERA"
        case .twoLetterWord:
            return "PAROLE DI DUE LETTERE"
        case .threeLetterWord:
            return "PAROLE DI TRE LETTERE"
        case .fourLetterWord:
            return "PAROLE DI QUATTRO LETTERE"
        case .fiveLetterWord:
            return "PAROLE DI CINQUE LETTERE"
        case .sixLetterWord:
            return "PAROLE DI SEI LETTERE"
        case .sevenLetterWord:
            return "PAROLE DI SETTE LETTERE"
        case .eightLetterWord:
            return "PAROLE DI OTTO LETTERE"
        case .nineLetterWord:
            return "PAROLE DI NOVE LETTERE"
        case .tenLetterWord:
            return "PAROLE DI DIECI LETTERE"
        }
    }
    
}



