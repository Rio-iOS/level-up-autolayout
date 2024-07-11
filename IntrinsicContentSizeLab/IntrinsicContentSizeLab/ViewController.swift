//
//  ViewController.swift
//  IntrinsicContentSizeLab
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
        let label1 = makeLabel(withText: "label1")
        let label2 = makeLabel(withText: "a much longer label")
        let label3 = makeLabel(withText: "label3")
        let label4 = makeLabel(withText: "label4")
        let bigLabel = BigLabel()

        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(bigLabel)
        
        bigLabel.translatesAutoresizingMaskIntoConstraints = false
        bigLabel.text = "BigLabel"
        bigLabel.backgroundColor = .yellow

        label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 8).isActive = true
        label2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 8).isActive = true
        label3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        label3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label3.heightAnchor.constraint(equalToConstant: 200).isActive = true
        label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 8).isActive = true
        label4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: label4.trailingAnchor, constant: 8).isActive = true
        bigLabel.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 8).isActive = true
        bigLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true

    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = .systemFont(ofSize: 32)
        label.backgroundColor = .yellow
        return label
    }
}

class BigLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: 300)
    }
}
