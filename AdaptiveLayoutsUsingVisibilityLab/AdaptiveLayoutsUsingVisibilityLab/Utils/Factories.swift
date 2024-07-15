//
//  Factories.swift
//  AdaptiveLayoutsUsingVisibilityLab
//
//  Created by 藤門莉生 on 2024/07/15.
//

import Foundation
import UIKit

func makeLebel(withText text: String, size: CGFloat, color: UIColor) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = color
    label.textAlignment = .center
    label.numberOfLines = 0
    label.text = text
    label.font = .systemFont(ofSize: size)
    return label
}

func makeButton(withtText text: String, size: CGFloat, color: UIColor) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.backgroundColor = color
    button.titleLabel?.font = .systemFont(ofSize: size)
    var configuration = UIButton.Configuration.filled()
    configuration.baseBackgroundColor = color
    configuration.cornerStyle = .capsule
    configuration.contentInsets = .init(top: 8, leading: 16, bottom: 8, trailing: 16)
    button.configuration = configuration
    return button
}

func makeStackViews(withOrientation axis: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 8.0
    return stackView
}
