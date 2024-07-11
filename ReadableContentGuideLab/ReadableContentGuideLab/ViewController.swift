//
//  ViewController.swift
//  ReadableContentGuideLab
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
//        let redView = UIView()
//        redView.translatesAutoresizingMaskIntoConstraints = false
//        redView.backgroundColor = .red
//        
//        view.addSubview(redView)
//        
//        NSLayoutConstraint.activate([
//            redView.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
//            redView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
//            redView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
//            redView.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
//        ])
        
        let label = makeLabel(withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
        ])
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        return label
    }
}
