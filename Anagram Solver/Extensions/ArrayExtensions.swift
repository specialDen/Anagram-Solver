//
//  ArrayExtensions.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 09.02.2023.
//

import UIKit

public extension Array where Element == UIView {
    func toStackView(orientation: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution = .fill, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: self)
        stackView.axis = orientation
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
}
