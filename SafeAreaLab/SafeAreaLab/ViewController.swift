//
//  ViewController.swift
//  SafeAreaLab
//
//  Created by 藤門莉生 on 2024/07/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        let topLabel = makeLabel(withText: "top")
        let bottomLabel = makeLabel(withText: "bottom")
        let leadingLabel = makeLabel(withText: "leading")
        let trailingLabel = makeLabel(withText: "trailing")

        view.addSubview(topLabel)
        view.addSubview(bottomLabel)
        view.addSubview(leadingLabel)
        view.addSubview(trailingLabel)

        // topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        // topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        // topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        // view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: bottomLabel.bottomAnchor).isActive = true
        // bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        // view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: bottomLabel.bottomAnchor, constant: 8).isActive = true
        // bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: bottomLabel.bottomAnchor, constant: 8),
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            leadingLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            leadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            trailingLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            trailingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        label.font = .systemFont(ofSize: 32)
        return label
    }
}
