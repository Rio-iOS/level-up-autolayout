//
//  Factories.swift
//  AdaptiveLayouts-SpotifyPlayer-WithSpacer
//
//  Created by 藤門莉生 on 2024/07/15.
//

import Foundation
import UIKit

let buttonHeight: CGFloat = 40

func makeImageView(named: String) -> UIImageView {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: named)
    imageView.contentMode = .scaleAspectFit
    imageView.setContentHuggingPriority(.init(249), for: .vertical)
    imageView.setContentCompressionResistancePriority(.init(749), for: .vertical)
    return imageView
}

func makeTrackLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textAlignment = .center
    label.font = .boldSystemFont(ofSize: 18)
    return label
}

func makeAlbumLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 16)
    label.textColor = .lightGray
    return label
}

func makePlayBuutton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(.init(named: "play"), for: .normal)
    button.frame = .init(x: 100, y: 100, width: 100, height: 100)
    return button
}

func makePreviewLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 10)
    return label
}

func makeProgressView() -> UIProgressView {
    let progressView = UIProgressView()
    progressView.translatesAutoresizingMaskIntoConstraints = false
    progressView.tintColor = .gray
    return progressView
}

func makeSpotifyButton(withText title: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    
    var configuration = UIButton.Configuration.filled()
    configuration.baseBackgroundColor = .spotifyGreen
    configuration.cornerStyle = .capsule
    configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: buttonHeight, bottom: 10, trailing: buttonHeight)
    button.configuration = configuration
    
    button.layer.cornerRadius = buttonHeight/2
    
    button.titleLabel?.minimumScaleFactor = 0.5
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    
    let attributedText = NSMutableAttributedString(
        string: title,
        attributes: [
            .font: UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor: UIColor.white,
            .kern: 1
        ]
    )
    
    button.setAttributedTitle(attributedText, for: .normal)
    return button
}

func makeStackView(withOrentation axis: NSLayoutConstraint.Axis, spacing: CGFloat = 8.0) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = spacing
    return stackView
}

func makeSpaceView(height: CGFloat? = nil) -> UIView {
    let spacerView = UIView()
    if let height {
        spacerView.heightAnchor.constraint(equalToConstant: height).setActivateBreakable()
    }
    spacerView.translatesAutoresizingMaskIntoConstraints = false
    return spacerView
}

private extension NSLayoutConstraint {
    @objc func setActivateBreakable(priority: UILayoutPriority = .init(900)) {
        self.priority = priority
        isActive = true
    }
}
