//
//  ViewController.swift
//  AdaptiveLayoutsUsingVisibilityLab
//
//  Created by 藤門莉生 on 2024/07/15.
//

import UIKit

class ViewController: UIViewController {

    private let label2 = makeLebel(withText: "Now you don't", size: 32, color: .red)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        let stackView = makeStackViews(withOrientation: .vertical)
        stackView.distribution = .fillProportionally
        
        let label1 = makeLebel(withText: "Now you see me", size: 32, color: .yellow)
        let button = makeButton(withtText: "Show/Hide", size: 32, color: .blue)
        
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(button)
        
        view.addSubview(stackView)
       
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        button.addTarget(self, action: #selector(buttonPressed), for: .primaryActionTriggered)
    }
}

private extension ViewController {
    @objc func buttonPressed(sender: UIButton) {
        label2.isHidden.toggle()
    }
}
