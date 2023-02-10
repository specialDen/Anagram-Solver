//
//  HomeViewController.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 02.02.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: AnagramSolverPresenterProtocol?
    var language: LanguagesEnum = .english
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        searchViewButton.addTarget(self, action: #selector(didTapSearch), for: .touchUpInside)
        languageSelectButton.addTarget(self, action: #selector(didTapSelectLanguage), for: .touchUpInside)
        italianButton.addTarget(self, action: #selector(didSelectItalian), for: .touchUpInside)
        germanButton.addTarget(self, action: #selector(didSelectGerman), for: .touchUpInside)
        englishButton.addTarget(self, action: #selector(didSelectEnglish), for: .touchUpInside)
        russianButton.addTarget(self, action: #selector(didSelectRussian), for: .touchUpInside)
        spanishButton.addTarget(self, action: #selector(didSelectSpanish), for: .touchUpInside)
        frenchButton.addTarget(self, action: #selector(didSelectFrench), for: .touchUpInside)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private let searchView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 0
//        view.layer.backgroundColor = AppColors.searchBarColor?.cgColor
        view.backgroundColor = AppColors.searchBarColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let searchViewButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Tap to search", for: .normal)
        button.setTitleColor(AppColors.searchBarPlaceholderColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Chalkduster", size: 17)
        button.titleLabel?.textAlignment = .right
//        button.layer.backgroundColor = AppColors.searchBarColor?.cgColor
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let appLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "ANAGRAMS\n SOLVER"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor  = AppColors.appNameColor
        label.font = UIFont(name: "Bradley Hand", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let searchViewImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.image?.withTintColor(.systemGray5)
        imageView.tintColor = AppColors.searchBarPlaceholderColor
//        imageView.layer.backgroundColor = AppColors.searchBarColor?.cgColor
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let languageSelectButton: LangOptionButton = {
        let button = LangOptionButton(withViewModel: .english)
        button.tintColor = AppColors.searchBarPlaceholderColor
        button.languageTitlelabel.textColor = AppColors.searchBarPlaceholderColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let englishButton: LanguageButton = {
        let button = LanguageButton(withViewModel: .english, borderToHighlight: .right)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let russianButton: LanguageButton = {
        let button = LanguageButton(withViewModel: .russian, borderToHighlight: .right)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let spanishButton: LanguageButton = {
        let button = LanguageButton(withViewModel: .spanish, borderToHighlight: .right)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let frenchButton: LanguageButton = {
        let button = LanguageButton(withViewModel: .french, borderToHighlight: .right)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let germanButton: LanguageButton = {
        let button = LanguageButton(withViewModel: .german, borderToHighlight: .right)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let italianButton: LanguageButton = {
        let button = LanguageButton(withViewModel: .italian, borderToHighlight: .none)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack = [englishButton, russianButton, frenchButton, spanishButton, germanButton, italianButton].toStackView(orientation: .horizontal, distribution: .fillEqually, spacing: 0)
//        stack.backgroundColor = .systemGray
        stack.isHidden = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.borderWidth = 1.5
        stack.layer.borderColor = UIColor.systemGray.cgColor
        stack.layer.cornerRadius = 12
        return stack
    }()
    

    
    @objc private func didTapSearch(){
        presenter?.viewNeedsSecondScreen(presentingVC: self, language: language)
    }
    
    
    @objc private func didSelectItalian(){
        language = .english
        languageSelectButton.updateButtonUI(withViewModel: language)
        searchViewButton.setTitle(language.homeVCString, for: .normal)
        buttonStackView.isHidden = true
        languageSelectButton.changeArrowType()
    }
    @objc private func didSelectGerman(){
        language = .german
        languageSelectButton.updateButtonUI(withViewModel: language)
        searchViewButton.setTitle(language.homeVCString, for: .normal)
        buttonStackView.isHidden = true
        languageSelectButton.changeArrowType()
    }
    @objc private func didSelectEnglish(){
        language = .english
        languageSelectButton.updateButtonUI(withViewModel: language)
        searchViewButton.setTitle(language.homeVCString, for: .normal)
        buttonStackView.isHidden = true
        languageSelectButton.changeArrowType()
    }
    @objc private func didSelectRussian(){
        language = .russian
        languageSelectButton.updateButtonUI(withViewModel: language)
        searchViewButton.setTitle(language.homeVCString, for: .normal)
        buttonStackView.isHidden = true
        languageSelectButton.changeArrowType()
//        languageSelectButton.iconImageView.image = UIImage(named: language.parameters.imageName)
    }
    @objc private func didSelectSpanish(){
        language = .spanish
        languageSelectButton.updateButtonUI(withViewModel: language)
        searchViewButton.setTitle(language.homeVCString, for: .normal)
        buttonStackView.isHidden = true
        languageSelectButton.changeArrowType()
    }
    @objc private func didSelectFrench(){
        language = .french
        languageSelectButton.updateButtonUI(withViewModel: language)
        searchViewButton.setTitle(language.homeVCString, for: .normal)
        buttonStackView.isHidden = true
        languageSelectButton.changeArrowType()
//        languageSelectButton.layoutSubviews()
    }
    @objc private func didTapSelectLanguage() {
        languageSelectButton.changeArrowType()
        
        buttonStackView.isHidden = !buttonStackView.isHidden
    }
    
    
    
    private func setUpUI() {
        view.backgroundColor = AppColors.homeScreenBackground
        addSubViews()
        setFramesAndConstraints()
    }
    
    
    private func addSubViews() {
        
        view.addSubview(searchView)
        view.addSubview(appLabel)
        view.addSubview(languageSelectButton)
        view.addSubview(buttonStackView)
        
        searchView.addSubview(searchViewButton)
        searchView.addSubview(searchViewImageView)
        
    }
    
    private func setFramesAndConstraints(){
        
        let languageSelectButtonConstraints = [languageSelectButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                               languageSelectButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
                                               languageSelectButton.heightAnchor.constraint(equalToConstant: 40),
                                               languageSelectButton.widthAnchor.constraint(equalToConstant: 100)]
        
        
        let buttonStackViewConstraints = [buttonStackView.topAnchor.constraint(equalTo: languageSelectButton.bottomAnchor),
                                          buttonStackView.rightAnchor.constraint(equalTo: languageSelectButton.rightAnchor, constant: -5),
                                          buttonStackView.heightAnchor.constraint(equalToConstant: 50),
                                          buttonStackView.widthAnchor.constraint(equalToConstant: 300)]
        
        let searchViewConstraints = [searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
                                     searchView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     searchView.heightAnchor.constraint(equalToConstant: 50),
                                     searchView.widthAnchor.constraint(equalToConstant: view.bounds.width - 50)]
        
        let searchViewLabelConstraints = [searchViewButton.topAnchor.constraint(equalTo: searchView.topAnchor),
                                          searchViewButton.bottomAnchor.constraint(equalTo: searchView.bottomAnchor),
                                          searchViewButton.leadingAnchor.constraint(equalTo: searchView.leadingAnchor),
                                          searchViewButton.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -50)]
        
        let appLabelConstraints = [appLabel.bottomAnchor.constraint(equalTo: searchView.topAnchor, constant: -30),
                                   appLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                   appLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)]
        
        let searchViewImageViewConstraints = [searchViewImageView.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 14), searchViewImageView.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -14), searchViewImageView.leadingAnchor.constraint(equalTo: searchViewButton.trailingAnchor, constant: 14), searchViewImageView.trailingAnchor.constraint(equalTo: searchView.trailingAnchor,constant: -14)]
        
        NSLayoutConstraint.activate(searchViewConstraints)
        NSLayoutConstraint.activate(searchViewLabelConstraints)
        NSLayoutConstraint.activate(appLabelConstraints)
        NSLayoutConstraint.activate(searchViewImageViewConstraints)
        NSLayoutConstraint.activate(languageSelectButtonConstraints)
        NSLayoutConstraint.activate(buttonStackViewConstraints)
    }

    
   
}

