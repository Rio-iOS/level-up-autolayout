//
//  PlayerView.swift
//  AdaptiveLayouts-SpotifyPlayer-WithSpacer
//
//  Created by 藤門莉生 on 2024/07/15.
//

import Foundation
import UIKit

class PlayerView: UIView {
    private var topSpacer: UIView
    private var bottomSpacer: UIView
    
    init() {
        topSpacer = makeSpaceView(height: 100)
        bottomSpacer = makeSpaceView(height: 100)
        
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: UIView.noIntrinsicMetric, height: 200)
    }
    
    func adjustForOrientiation() {
        if UIDevice.current.orientation.isPortrait {
            topSpacer.isHidden = true
            bottomSpacer.isHidden = true
        } else {
            topSpacer.isHidden = false
            bottomSpacer.isHidden = false
        }
    }
}

private extension PlayerView {
    func setupViews() {
        let stackView = makeStackView(withOrentation: .vertical)
        stackView.distribution = .fillProportionally
        
        let trackLabel = makeTrackLabel(withText: "Tom Sawyer")
        let albumLabel = makeAlbumLabel(withText: "Rush * Moving Pictures (2011 Remaster)")
        let progressView = ProgressRow()
        let spotifyButton = makeSpotifyButtonCustomView()
        
        addSubview(stackView)
       
        stackView.addArrangedSubview(topSpacer)
        stackView.addArrangedSubview(trackLabel)
        stackView.addArrangedSubview(albumLabel)
        stackView.addArrangedSubview(progressView)
        stackView.addArrangedSubview(spotifyButton)
        stackView.addArrangedSubview(bottomSpacer)
        
        // static constraints
        NSLayoutConstraint.activate([
            // topSpacer & bottomSpacer
            topSpacer.heightAnchor.constraint(equalTo: bottomSpacer.heightAnchor),
            
            // stackView
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
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
