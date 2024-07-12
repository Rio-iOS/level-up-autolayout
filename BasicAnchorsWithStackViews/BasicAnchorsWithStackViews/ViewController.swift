//
//  ViewController.swift
//  BasicAnchorsWithStackViews
//
//  Created by 藤門莉生 on 2024/07/12.
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
        let offlineRow = RowView(title: "Offline", isOn: false)
        let offlineSubLabel = makeSubLabel(withText: "When you go offline, you'll only be able to play the music and podcasts you've downloaded.")
        // offlineContainerStackView
        let offlineContainerStackView = makeStackView(spacing: 20)
        offlineContainerStackView.addArrangedSubview(offlineRow)
        offlineContainerStackView.addArrangedSubview(offlineSubLabel)

        // crossFadeView
        let crossFadeView = CrossFadeView()
        
        let gaplessPlaybackRow = RowView(title: "Gapless Playback", isOn: true)
        let hideSongsRow = RowView(title: "Hide Unplayable Songs", isOn: true)
        let enableNormalizationRow = RowView(title: "Enable Audio Normalization", isOn: true)
        // rowContainerStackView
        let rowContainerStackView = makeStackView(spacing: 32)
        rowContainerStackView.addArrangedSubview(gaplessPlaybackRow)
        rowContainerStackView.addArrangedSubview(hideSongsRow)
        rowContainerStackView.addArrangedSubview(enableNormalizationRow)

        // containerStackView
        let containerStackView = makeStackView(spacing: 32)
        containerStackView.addArrangedSubview(offlineContainerStackView)
        containerStackView.addArrangedSubview(crossFadeView)
        containerStackView.addArrangedSubview(rowContainerStackView)

        view.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            // containerStackView
            containerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor, constant: 20),
        ])
    }
}

