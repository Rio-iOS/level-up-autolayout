//
//  ViewController.swift
//  AdaptiveLayoutsLab
//
//  Created by 藤門莉生 on 2024/07/15.
//

import UIKit

class ViewController: UIViewController {
    private var leadingAnchorConstraint = NSLayoutConstraint()
    private var trailingAnchorConstraint = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupkViews()
    }
}

private extension ViewController {
    func setupkViews() {
        let label = makeLabel(withText: "Watch me!", size: 32)
        let button = makeButton(withText: "Left/Right")
        
        view.addSubview(label)
        view.addSubview(button)
        
        leadingAnchorConstraint = label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80)
        leadingAnchorConstraint.isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(buttonPressed), for: .primaryActionTriggered)
    }
}

// MARK: Selector
private extension ViewController {
    @objc func buttonPressed(sender: UIButton) {
        if leadingAnchorConstraint.constant == 80 {
            leadingAnchorConstraint.constant = 80 * 2
        } else {
            leadingAnchorConstraint.constant = 80
        }
    }
}
