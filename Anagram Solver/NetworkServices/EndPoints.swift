//
//  EndPoints.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 02.02.2023.
//

import Foundation

protocol EndPointProtocol {
    var completeURL: String { get }
}

enum AnagramSolverEndPoint: EndPointProtocol {
    
    case getAllAnagrams(searchFilter: String)
    case getBestAnagrams(searchFilter: String)

    
    private var baseURL: String {
        return "http://www.anagramica.com/"
    }
    
    var completeURL: String {
        switch self {
        case .getAllAnagrams(let searchString):
            return baseURL + "all/:" + searchString
        case .getBestAnagrams(let searchString):
            return baseURL + "best/:" + searchString
        }
        
    }

}

