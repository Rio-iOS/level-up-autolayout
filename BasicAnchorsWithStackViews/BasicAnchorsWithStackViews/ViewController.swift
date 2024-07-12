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
    func setupNavigation() {
        
    }
    
    func setupViews() {
        let offlineLabel = makeLabel(withText: "Offline")
        let offlineSwitch = makeSwitch(isOn: false)
        let offlineSubLabel = makeSubLabel(withText: "When you go offline, you'll only be able to play the music and podcasts you've downloaded.")
        let crossfadeLabel = makeBoldLabel(withText: "Crossfade")
        let crossfadeMinLabel = makeSubLabel(withText: "0s")
        let progressView = makeProgressView()
        let crossfadeMaxLabel = makeSubLabel(withText: "12s")
        let gaplessPlaybackRow = RowView(title: "Gapless Playback", isOn: true)
        let hideSongsRow = RowView(title: "Hide Unplayable Songs", isOn: true)
        let enableNormalizationRow = RowView(title: "Enable Audio Normalization", isOn: true)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.distribution = .fill

        stackView.addArrangedSubview(gaplessPlaybackRow)
        stackView.addArrangedSubview(hideSongsRow)
        stackView.addArrangedSubview(enableNormalizationRow)
        
        view.addSubview(offlineLabel)
        view.addSubview(offlineSwitch)
        view.addSubview(offlineSubLabel)
        view.addSubview(crossfadeLabel)
        view.addSubview(crossfadeMinLabel)
        view.addSubview(progressView)
        view.addSubview(crossfadeMaxLabel)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            // offlineLabel
            offlineLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            offlineLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            // offlineSwitch
            offlineSwitch.centerYAnchor.constraint(equalTo: offlineLabel.centerYAnchor),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: offlineSwitch.trailingAnchor, constant: 20),
            
            // offlineSubLabel
            offlineSubLabel.topAnchor.constraint(equalTo: offlineLabel.bottomAnchor, constant: 20),
            offlineSubLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: offlineSubLabel.trailingAnchor, constant: 20),
            
            // crossfadeLabel
            crossfadeLabel.topAnchor.constraint(equalTo: offlineSubLabel.bottomAnchor, constant: 32),
            crossfadeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: crossfadeLabel.trailingAnchor, constant: 20),
            
            // crossMinLabel
            crossfadeMinLabel.topAnchor.constraint(equalTo: crossfadeLabel.bottomAnchor, constant: 32),
            crossfadeMinLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            // progressView
            progressView.centerYAnchor.constraint(equalTo: crossfadeMinLabel.centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: crossfadeMinLabel.trailingAnchor, constant: 8),
            
            // crossMaxLabel
            crossfadeMaxLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            crossfadeMaxLabel.leadingAnchor.constraint(equalTo: progressView.trailingAnchor, constant: 8),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: crossfadeMaxLabel.trailingAnchor, constant: 20),
           
            // stackview
            stackView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
}

