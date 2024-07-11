//
//  ViewController.swift
//  IntrinsicContentSize-SpotifyPlayer
//
//  Created by 藤門莉生 on 2024/07/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        let albumImage = makeImageView(named: "rush")
        let trackLabel = makeTrackLabel(withText: "Tom Sawyer")
        let albumLabel = makeAlbumLabel(withText: "Rush * Moving Pictures (2011 Remaster)")
        let playButton = makePlayBuutton()
        let previewStartLabel = makePreviewLabel(withText: "0：00")
        let progressView = makeProgressView()
        let previewEndLabel = makePreviewLabel(withText: "0：30")
        let spotifyButton = makeSpotifyButton(withText: "PLAY ON SPOTIFY")

        view.addSubview(albumImage)
        view.addSubview(trackLabel)
        view.addSubview(albumLabel)
        view.addSubview(playButton)
        view.addSubview(previewStartLabel)
        view.addSubview(progressView)
        view.addSubview(previewEndLabel)
        view.addSubview(spotifyButton)
        
        NSLayoutConstraint.activate([
            // albumImage
            albumImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor, multiplier: 1),
            albumImage.widthAnchor.constraint(equalToConstant: view.bounds.width),
            
            // trackLabel
            trackLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 8),
            trackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            trackLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            // albumLabel
            albumLabel.topAnchor.constraint(equalTo: trackLabel.bottomAnchor, constant: 8),
            albumLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            albumLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            // playButton
            playButton.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 8),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
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
            previewEndLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            // spotifyButton
            spotifyButton.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 32),
            spotifyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spotifyButton.heightAnchor.constraint(equalToConstant: buttonHeight),
        ])
    }
}
