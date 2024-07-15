//
//  ViewController.swift
//  AdaptiveLayouts-SpotifyPlayer-WithSpacer
//
//  Created by 藤門莉生 on 2024/07/15.
//

import UIKit

class ViewController: UIViewController {

    private var stackView: UIStackView
    private var playerView: PlayerView
   
    var bottomAnchorConstraint = NSLayoutConstraint()
    
    init() {
        stackView = makeStackView(withOrentation: .vertical)
        playerView = PlayerView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForOrientationChanges()
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        stackView.addArrangedSubview(makeAlbumImageView())
        stackView.addArrangedSubview(makePlayerStackView())
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        bottomAnchorConstraint = stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    }
    
    func registerForOrientationChanges() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
}

// MARK: factory
private extension ViewController {
    func makeAlbumImageView() -> UIImageView {
        let albumImage = makeImageView(named: "rush")
        let heightAnchorConstraint = albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor)
        heightAnchorConstraint.priority = .defaultHigh
        heightAnchorConstraint.isActive = true
        
        return albumImage
    }
    
    func makePlayerStackView() -> UIStackView {
        let stackView = makeStackView(withOrentation: .vertical)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = .init(top: 0, leading: 8, bottom: 0, trailing: 8)
        stackView.addArrangedSubview(playerView)
        return stackView
    }
    
}

// MARK: selector
private extension ViewController {
    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            stackView.axis = .horizontal
            bottomAnchorConstraint.isActive = true
        } else {
            stackView.axis = .vertical
            bottomAnchorConstraint.isActive = false
        }
        
        playerView.adjustForOrientiation()
    }
}
