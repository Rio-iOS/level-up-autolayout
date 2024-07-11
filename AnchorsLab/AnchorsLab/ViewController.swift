//
//  ViewController.swift
//  AnchorsLab
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
        let upperLeftLabel = makeLabel(withText: "upperLeft")
        let upperRightLabel = makeLabel(withText: "upperRight")
        let lowerLeftLabel = makeSecondaryLabel(withText: "lowerLeft")
        let lowerRightButton = makeButton(withText: "lowerRight")
        let redView = makeView()
        let smallLabel = makeLabel(withText: "small", size:12)
        let largeLabel = makeLabel(withText: "large", size: 32)

        view.addSubview(upperLeftLabel)
        view.addSubview(upperRightLabel)
        view.addSubview(lowerLeftLabel)
        view.addSubview(lowerRightButton)
        view.addSubview(redView)
        view.addSubview(smallLabel)
        view.addSubview(largeLabel)
        
        upperLeftLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        upperLeftLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        
        upperRightLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: upperRightLabel.trailingAnchor, constant: 8).isActive = true
        // upperRightLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        lowerLeftLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        lowerLeftLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
    
        lowerRightButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        view.trailingAnchor.constraint(equalTo: lowerRightButton.trailingAnchor, constant: 8).isActive = true
        // lowerRightButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
      
        // option1: size eplicitly
        redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // option2: size dynamically
        redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 20).isActive = true
        // redView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: 100).isActive = true
        // redView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true

        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        smallLabel.topAnchor.constraint(equalTo: upperLeftLabel.bottomAnchor, constant: 8).isActive = true
        smallLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        
        largeLabel.topAnchor.constraint(equalTo: smallLabel.topAnchor).isActive = true
        // largeLabel.centerYAnchor.constraint(equalTo: smallLabel.centerYAnchor).isActive = true
        // largeLabel.firstBaselineAnchor.constraint(equalTo: smallLabel.firstBaselineAnchor).isActive = true
        largeLabel.leadingAnchor.constraint(equalTo: smallLabel.trailingAnchor, constant: 8).isActive = true
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        return label
    }
    
    func makeLabel(withText text: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.font = .systemFont(ofSize: size)
        label.text = text
        return label
    }
    
    func makeSecondaryLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.text = text
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }
    
    func makeButton(withText text: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.backgroundColor = .blue
        return button
    }
    
    func makeView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }
}
