//
//  StringExtensions.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 08.02.2023.
//

import Foundation

extension String {
    
    func fileExtension() -> String {
        NSURL(fileURLWithPath: self).pathExtension!
    }
    
    func fileName() -> String {
        NSURL(fileURLWithPath: self).deletingPathExtension!.lastPathComponent
    }
    
    func unorderedContains(string: Self) -> Bool {
        guard self.count > string.count else {return false}
        guard !self.contains(string) else {return true}
        var dictArray = Array(self)
//        let searchArray = Array(string)
        for char in string {
            guard let index = dictArray.firstIndex(of: char) else {return false}
            dictArray.remove(at: index)
        }
        return true
    }
    
}
