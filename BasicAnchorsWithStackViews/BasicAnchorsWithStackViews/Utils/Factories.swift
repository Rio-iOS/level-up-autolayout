//
//  Factories.swift
//  BasicAnchorsWithStackViews
//
//  Created by 藤門莉生 on 2024/07/12.
//

import Foundation
import UIKit

func makeLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = .white
    label.font = .systemFont(ofSize: 17)
    return label
}

func makeSubLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = .gray
    label.font = .systemFont(ofSize: 13)
    label.numberOfLines = 0
    return label
}

func makeBoldLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = .white
    label.font = .systemFont(ofSize: 17, weight: .bold)
    label.textAlignment = .center
    return label
}

func makeSwitch(isOn: Bool) -> UISwitch {
    let `switch` = UISwitch()
    `switch`.translatesAutoresizingMaskIntoConstraints = false
    `switch`.isOn = isOn
    return `switch`
}

func makeProgressView() -> UIProgressView {
    let progressView = UIProgressView(progressViewStyle: .default)
    progressView.translatesAutoresizingMaskIntoConstraints = false
    progressView.tintColor = .gray
    return progressView
}

func makeStackView(
    spacing: CGFloat,
    axis: NSLayoutConstraint.Axis = .vertical,
    alignment: UIStackView.Alignment = .fill
) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.spacing = spacing
    stackView.distribution = .fill
    stackView.alignment = alignment
    return stackView
}
