//
//  SearchResultsTableViewManager.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 04.02.2023.
//

import UIKit

protocol SearchResultsTableViewManagerProtocol {
    func setUpTableView(tableView: UITableView )
    func setUpSearchresults(with words: [WordLists]?)
//    func updateContentType(with type: ContentType)
}

final class SearchResultsTableViewManager: NSObject {
    weak var tableView: UITableView?
    var wordlist: [WordLists] = []
}

extension SearchResultsTableViewManager: SearchResultsTableViewManagerProtocol {
    
    func setUpSearchresults(with words: [WordLists]?) {
        DispatchQueue.main.async {
            guard let words = words else {return}
            self.wordlist = words
            self.tableView?.reloadData()
        }

    }
    
    func setUpTableView(tableView: UITableView) {
        self.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        register a cell
    }
}

extension SearchResultsTableViewManager: UITableViewDelegate {
    
}

extension SearchResultsTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return wordlist.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return wordlist[section].description
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {return UITableViewCell()}
        cell.textLabel?.text = wordlist[section].description
        cell.textLabel?.font = UIFont(name: "Hoefler Text", size: 17)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {return UITableViewCell()}
        var wordString = wordlist[indexPath.section].words[0]
        for index in 1..<wordlist[indexPath.section].words.count {
            wordString = wordString + ", " + wordlist[indexPath.section].words[index]
        }
        cell.textLabel?.text = wordString
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name: "Hoefler Text", size: 17)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        100
//    }
}

//class

