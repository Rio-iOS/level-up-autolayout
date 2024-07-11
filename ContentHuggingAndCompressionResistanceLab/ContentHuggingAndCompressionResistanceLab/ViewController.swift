//
//  ViewController.swift
//  ContentHuggingAndCompressionResistanceLab
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
        let label = makeLabel(withText: "Name")
        let textField = makeTextField(withPlaceHolderText: "Enter name here")
        
        view.addSubview(label)
        view.addSubview(textField)
        
        // 以下の場合、曖昧な制約になる
        // Width is ambiguous for UILabel - Name.
        // Width and horizontal position are ambiguous for UITextField.
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        textField.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8).isActive = true
        view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8).isActive = true
        
        // 以下を追加することで、曖昧な制約がなくなる
        label.setContentHuggingPriority(.init(251), for: .horizontal)
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        return label
    }
    
    func makeTextField(withPlaceHolderText text: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = text
        textField.backgroundColor = .lightGray
        return textField
    }
}
