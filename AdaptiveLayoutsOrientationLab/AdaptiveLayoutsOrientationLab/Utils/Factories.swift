//
//  Factories.swift
//  AdaptiveLayoutsOrientationLab
//
//  Created by 藤門莉生 on 2024/07/15.
//

import Foundation
import UIKit

func makeStackView(withOrientation axis: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 8.0

    return stackView
}
