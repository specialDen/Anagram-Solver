//
//  ViewController.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 02.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var presenter: AnagramSolverPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        searchViewButton.addTarget(self, action: #selector(didTapSearch), for: .touchUpInside)
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
        view.layer.borderWidth = 1.5
        view.layer.backgroundColor = UIColor.secondarySystemBackground.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let searchViewButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Tap to search", for: .normal)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.titleLabel?.font = UIFont(name: "Chalkduster", size: 17)
        button.titleLabel?.textAlignment = .right
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let appLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "ANAGRAMS\n FinDer"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor  = .systemPurple
        label.font = UIFont(name: "Bradley Hand", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let searchViewImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.image?.withTintColor(.systemGray5)
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    @objc private func didTapSearch(){
//        presentSeconVC≥≤æ…æ¬˚∆˙˜ƒ∂ç√∫√∫˜µ∆ˆˆøπ“‘«“ππø¬…∆∫∫ ˜˜µµµ®çƒç†√
        presenter?.viewNeedsSecondScreen(presentingVC: self)
    }
    
    private func setUpUI() {
        view.backgroundColor = .systemFill
        addSubViews()
        setFramesAndConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(searchView)
        view.addSubview(appLabel)
        searchView.addSubview(searchViewButton)
        searchView.addSubview(searchViewImageView)
    }
    
    private func setFramesAndConstraints(){
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

    }

    
   
}

