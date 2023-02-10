//
//  LangOptionButton.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 09.02.2023.
//

import UIKit

class LangOptionButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        setFramesAndConstraints()
    }

    var viewModel:LanguageButtonModel? = nil
    var isArrowDown:Bool  = true

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(withViewModel viewModel: LanguagesEnum) {
        super.init(frame: .zero)
        self.viewModel  = viewModel.parameters
        setUpButtonUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let languageTitlelabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let listIconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.image =  UIImage(systemName: "chevron.down")
        return imageView
    }()
    
    
    private func setUpButtonUI() {
        addSubview(iconImageView)
        addSubview(languageTitlelabel)
        addSubview(listIconImageView)
        setFramesAndConstraints()

        iconImageView.image = UIImage(named: viewModel!.imageName)
        languageTitlelabel.text = viewModel?.titleString
        
    }
    
    func changeArrowType(){
        if !isArrowDown {
            listIconImageView.image = UIImage(systemName: "chevron.down")
        } else {
            listIconImageView.image = UIImage(systemName: "chevron.up")
        }
        isArrowDown = !isArrowDown
        
    }
    
    func updateButtonUI(withViewModel viewModel: LanguagesEnum){
        self.viewModel  = viewModel.parameters
        iconImageView.image = UIImage(named: viewModel.parameters.imageName)
        languageTitlelabel.text = viewModel.parameters.titleString
        reloadInputViews()
    }
    
    private func setFramesAndConstraints(){
        
        let height = frame.size.height
        let width = frame.size.width/3

        languageTitlelabel.frame = CGRect(x: 0, y: 0, width: width, height: height)
        iconImageView.frame = CGRect(x: width, y: 0, width: width, height: height)
        listIconImageView.frame = CGRect(x: 2.3*width, y: 0.3*height, width: width*0.6, height: 0.5*height)
        
    }
    
    
}
