//
//  LanguageButton.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 09.02.2023.
//

import UIKit

class LanguageButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        setFramesAndConstraints()
    }
    
    var viewModel:LanguageButtonModel? = nil
    var borderToHighlight: BorderType? = nil
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        guard let borderToHighlight = borderToHighlight else {return}
        
        switch borderToHighlight {
        case .right:
            self.addRightBorderWithColor(color: .systemGray, width: 1)
        case .left:
            self.addLeftBorderWithColor(color: .systemGray, width: 1)
        case .top:
            self.addTopBorderWithColor(color: .systemGray, width: 1)
        case .bottom:
            self.addBottomBorderWithColor(color: .systemGray, width: 1)
        case .none:
            break
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(withViewModel viewModel: LanguagesEnum, borderToHighlight: BorderType) {
        super.init(frame: .zero)
        self.viewModel  = viewModel.parameters
        self.borderToHighlight = borderToHighlight
        setUpButtonUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let languageTitlelabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    

    
    private func setUpButtonUI() {
        addSubview(iconImageView)
        addSubview(languageTitlelabel)
        setFramesAndConstraints()

        iconImageView.image = UIImage(named: viewModel!.imageName)
        languageTitlelabel.text = viewModel?.titleString
        

        
    }
    
    private func setFramesAndConstraints(){
        let height = frame.size.height/2
        let width = frame.size.width

        languageTitlelabel.frame = CGRect(x: 0, y: 0, width: width, height: height)
        iconImageView.frame = CGRect(x: 0, y: height, width: width, height: 0.8*height)
    }
    
}


struct LanguageButtonModel {
    let imageName: String
    let titleString: String
    
}

enum BorderType {
    case right
    case left
    case top
    case bottom
    case none
}


