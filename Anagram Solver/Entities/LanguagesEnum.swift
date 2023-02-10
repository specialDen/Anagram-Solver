//
//  LanguagesEnum.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 09.02.2023.
//

import Foundation

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
    
    var searchBarPlaceholderText: String {
        
        switch self {
        case .english:
            return "Type in not more than 9 letters"
        case .russian:
            return "Введите не более 9 букв"
        case .german:
            return "Geben Sie nicht mehr als 9 Buchstaben ein"
        case .french:
            return "Tapez pas plus de 9 lettres"
        case .italian:
            return "Digitare non più di 9 lettere"
        case .spanish:
            return "Escriba no más de 9 letras"
        }
    }
    
    var fileDirectory: String {
        
        switch self {
        case .english:
            return ""
        case .russian:
            return "myRussianJSONDict.json"
        case .german:
            return "myGermanJSONDict.json"
        case .french:
            return "myFrenchJSONDict.json"
        case .italian:
            return ""
        case .spanish:
            return "mySpanishJSONDict.json"
        }
    }
    
}
