//
//  ViewController.swift
//  AdaptiveLayoutsOrientationLab
//
//  Created by 藤門莉生 on 2024/07/15.
//

import UIKit

class ViewController: UIViewController {
    private var stackView = makeStackView(withOrientation: .vertical)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForOrientationChanges()
        setupViews()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

private extension ViewController {
    func registerForOrientationChanges() {
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    func setupViews() {
        let redView = RedView()
        let blueView = BlueView()
        
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(blueView)
        
        view.addSubview(stackView)
       
        NSLayoutConstraint.activate([
            redView.widthAnchor.constraint(equalTo: blueView.widthAnchor),
            redView.heightAnchor.constraint(equalTo: blueView.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
}

private extension ViewController {
    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            stackView.axis = .horizontal
        } else {
            print("Portrait")
            stackView.axis = .vertical
        }
    }
}
