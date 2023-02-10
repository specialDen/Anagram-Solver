//
//  SearchViewController+TextFieldDelegate.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 04.02.2023.
//

import UIKit

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let searchString = textField.text,
                !searchString.isEmpty else {return false}
        presenter?.viewNeedsWordData(forSearchString: searchString, language: language)
        searchBarTextField.resignFirstResponder()
        return true
    }
    
}
