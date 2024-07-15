//
//  Factories.swift
//  AdaptiveLayoutsAdjustSpacerLab
//
//  Created by 藤門莉生 on 2024/07/15.
//

import Foundation
import UIKit

func makeLabel(withText text: String, size: CGFloat) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = .yellow
    label.textAlignment = .center
    label.numberOfLines = 0
    label.text = text
    label.font = .systemFont(ofSize: size)
    return label
}

func makeStackView(withOrientation axis: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 8.0
    return stackView
}

func makeSpacerView(height: CGFloat? = nil) -> UIView {
    let spacerView = UIView(frame: .zero)
    
    if let height {
        let heightAnchorConstraint = spacerView.heightAnchor.constraint(equalToConstant: height)
        heightAnchorConstraint.priority = .init(900)
        heightAnchorConstraint.isActive = true
    }
    
    return spacerView
}
