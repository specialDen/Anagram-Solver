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
        guard self.count >= string.count else {return false} // 0(1)
        guard !self.contains(string) else {return true} // 0(n)
        var dictArray = Array(self) // 0(n)
        for char in string { // 0(n)
            guard let index = dictArray.firstIndex(of: char) else {return false} //0(n)
            dictArray.remove(at: index) // 0(n)
        }
        return true
    }
    
}
