//
//  Factories.swift
//  ScrollableStackViewsLab
//
//  Created by 藤門莉生 on 2024/07/12.
//

import Foundation
import UIKit

func makeLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    return label
}

func makeSwitch(isOn: Bool) -> UISwitch {
    let `switch` = UISwitch()
    `switch`.translatesAutoresizingMaskIntoConstraints = false
    `switch`.isOn = isOn
    return `switch`
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

func makeScrollView() -> UIScrollView {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
}

func makeSpacerView(height: CGFloat) -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    let heightAnchor = view.heightAnchor.constraint(equalToConstant: height)
    heightAnchor.priority = .init(900)
    heightAnchor.isActive = true
    view.backgroundColor = .lightGray
    return view
}
