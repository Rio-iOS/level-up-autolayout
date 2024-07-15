//
//  Factories.swift
//  AdaptiveLayoutsLab
//
//  Created by 藤門莉生 on 2024/07/15.
//

import Foundation
import UIKit

func makeLabel(withText text: String, size: CGFloat) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.font = .systemFont(ofSize: size)
    return label
}

func makeButton(withText text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    var configuration = UIButton.Configuration.filled()
    configuration.baseBackgroundColor = .systemBlue
    configuration.cornerStyle = .capsule
    configuration.contentInsets = .init(top: 8, leading: 16, bottom: 8, trailing: 16)
    button.configuration = configuration
    return button
}
