//
//  PlayerView.swift
//  AdaptiveLayouts-SpotifyPlayer
//
//  Created by 藤門莉生 on 2024/07/15.
//

import Foundation
import UIKit

class PlayerView: UIView {
    private var stackView: UIStackView
    private var topAnchorConstraint = NSLayoutConstraint()
    private var centerYConstraint = NSLayoutConstraint()
    
    init() {
        stackView = makeStackView(withOrentation: .vertical)
        stackView.distribution = .fillProportionally
        
        super.init(frame: .zero)
        
        setupViews()
        setupInitialOrientation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: UIView.noIntrinsicMetric, height: 200)
    }
    
    func adjustOrientation() {
        if UIDevice.current.orientation.isLandscape {
            topAnchorConstraint.isActive = false
            centerYConstraint.isActive = true
        } else {
            topAnchorConstraint.isActive = true
            centerYConstraint.isActive = false
        }
    }
}

private extension PlayerView {
    func setupViews() {
        let trackLabel = makeTrackLabel(withText: "Tom Sawyer")
        let albumLabel = makeAlbumLabel(withText: "Rush * Moving Pictures (2011 Remaster)")
        let progressView = ProgressRow()
        let spotifyButton = makeSpotifyButtonCustomView()
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(trackLabel)
        stackView.addArrangedSubview(albumLabel)
        stackView.addArrangedSubview(progressView)
        stackView.addArrangedSubview(spotifyButton)
        
        // static constraints
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func setupInitialOrientation() {
        topAnchorConstraint = stackView.topAnchor.constraint(equalTo: topAnchor)
        centerYConstraint = stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        if UIDevice.current.orientation.isPortrait {
            topAnchorConstraint.isActive = true
            centerYConstraint.isActive = false
        } else {
            topAnchorConstraint.isActive = false
            centerYConstraint.isActive = true
        }
    }
    
    func makeSpotifyButtonCustomView() -> UIView {
        let spotifyButton = makeSpotifyButton(withText: "PLAY ON SPOTIFY")
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(spotifyButton)
        
        NSLayoutConstraint.activate([
            // container
            container.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            // spotifyButton
            spotifyButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            spotifyButton.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            spotifyButton.heightAnchor.constraint(equalToConstant: buttonHeight),
        ])
        
        return container
    }
}
