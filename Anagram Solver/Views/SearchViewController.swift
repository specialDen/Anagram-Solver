//
//  SearchViewController.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 04.02.2023.
//

import UIKit

class SearchViewController:UIViewController {
    var presenter: AnagramSolverPresenterProtocol?
    var language: LanguagesEnum = .english
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
//        presenter = AnagramSolverPresenter()
        
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(didTapClear), for: .touchUpInside)
        searchBarTextField.becomeFirstResponder()
        searchBarTextField.returnKeyType = .search
        searchBarTextField.autocorrectionType = .no
        searchBarTextField.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    let searchBarTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.font = UIFont(name: "Hoefler Text", size: 17)
        textField.placeholder  = "Type in not more than 9 letters"
//        textField.tintColor = AppColors.searchBarPlaceholderColor
        textField.backgroundColor = AppColors.searchBarColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let searchBarView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 0
        view.backgroundColor = AppColors.searchBarColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = AppColors.searchBarPlaceholderColor
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = AppColors.searchBarPlaceholderColor
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = AppColors.homeScreenBackground
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    @objc private func didTapBack() {
        dismiss(animated: true)
    }
    
    @objc private func didTapClear() {
        searchBarTextField.text = ""
    }
    
    private func setUpUI() {
        view.backgroundColor = AppColors.homeScreenBackground
        addSubviews()
        setFramesAndConstraints()
        presenter?.tableViewManager?.setUpTableView(tableView: tableView)
        searchBarTextField.placeholder = language.searchBarPlaceholderText
    }
    private func addSubviews(){
        view.addSubview(searchBarView)
        searchBarView.addSubview(backButton)
        searchBarView.addSubview(searchButton)
        searchBarView.addSubview(searchBarTextField)
        view.addSubview(tableView)
    }
    
    private func setFramesAndConstraints() {
        
        let searchBarViewConstraints = [ searchBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                         searchBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                         searchBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                         searchBarView.heightAnchor.constraint(equalToConstant: 50)]
        
        let backButtonConstraints = [backButton.leftAnchor.constraint(equalTo: searchBarView.leftAnchor, constant: 5),
                                     backButton.widthAnchor.constraint(equalToConstant: 35),
                                     backButton.topAnchor.constraint(equalTo: searchBarView.topAnchor,constant: 5),
                                     backButton.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor,constant: -5)]
        
        let searchBarTextFieldConstraints = [searchBarTextField.topAnchor.constraint(equalTo: searchBarView.topAnchor),
                                             searchBarTextField.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor),
                                             searchBarTextField.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 14),
                                             searchBarTextField.rightAnchor.constraint(equalTo: searchButton.leftAnchor,constant: -14)]
        
        let searchButtonConstraints = [searchButton.rightAnchor.constraint(equalTo: searchBarView.rightAnchor, constant: -10),
                                       searchButton.widthAnchor.constraint(equalToConstant: 22),
                                       searchButton.topAnchor.constraint(equalTo: searchBarView.topAnchor,constant: 14),
                                       searchButton.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor,constant: -14)]
        
        let tableViewConstriants = [tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                                    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
                                    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
                                    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)]
        
        
        NSLayoutConstraint.activate(searchButtonConstraints)
        NSLayoutConstraint.activate(backButtonConstraints)
        NSLayoutConstraint.activate(searchBarViewConstraints)
        NSLayoutConstraint.activate(searchBarTextFieldConstraints)
        NSLayoutConstraint.activate(tableViewConstriants)
    }
}
