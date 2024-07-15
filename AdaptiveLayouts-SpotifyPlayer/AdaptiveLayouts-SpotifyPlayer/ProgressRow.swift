//
//  ProgressRow.swift
//  AdaptiveLayouts-SpotifyPlayer
//
//  Created by 藤門莉生 on 2024/07/15.
//

import Foundation
import UIKit

class ProgressRow: UIView {
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: 200, height: buttonHeight)
    }
}

private extension ProgressRow {
    func setupViews() {
        let playButton = makePlayBuutton()
        let previewStartLabel = makePreviewLabel(withText: "0：00")
        let progressView = makeProgressView()
        let previewEndLabel = makePreviewLabel(withText: "0：30")
        
        addSubview(playButton)
        addSubview(previewStartLabel)
        addSubview(progressView)
        addSubview(previewEndLabel)
       
        NSLayoutConstraint.activate([
            // playButton
            playButton.topAnchor.constraint(equalTo: topAnchor),
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            playButton.widthAnchor.constraint(equalToConstant: buttonHeight),
            playButton.heightAnchor.constraint(equalToConstant: buttonHeight),

            // previewStartLabel
            previewStartLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            previewStartLabel.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 8),

            // progressView
            progressView.centerYAnchor.constraint(equalTo: previewStartLabel.centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: previewStartLabel.trailingAnchor, constant: 8),

            // previewEndLabel
            previewEndLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            previewEndLabel.leadingAnchor.constraint(equalTo: progressView.trailingAnchor, constant: 8),
            previewEndLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
