//
//  ViewController.swift
//  MarginGuideSpacerViewLab
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
        let leadingGuide = UILayoutGuide()
        let okButton = makeButton(title: "OK", color: UIColor.darkBlue)
        let middleGuide = UILayoutGuide()
        let cancelButton = makeButton(title: "Cancel", color: UIColor.darkGreen)
        let trailingGuide = UILayoutGuide()
        
        view.addSubview(okButton)
        view.addSubview(cancelButton)
        view.addLayoutGuide(leadingGuide)
        view.addLayoutGuide(middleGuide)
        view.addLayoutGuide(trailingGuide)
        
        let margins = view.layoutMarginsGuide
      
        // leading guide
        margins.leadingAnchor.constraint(equalTo: leadingGuide.leadingAnchor).isActive = true
        leadingGuide.trailingAnchor.constraint(equalTo: okButton.leadingAnchor).isActive = true
        
        // middle guide
        okButton.trailingAnchor.constraint(equalTo: middleGuide.leadingAnchor).isActive = true
        middleGuide.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor).isActive = true
        
        // trailing guide
        cancelButton.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor).isActive = true
        trailingGuide.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        // button equal widths
        okButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor).isActive = true
        
        // spacer equal widths
        leadingGuide.widthAnchor.constraint(equalTo: middleGuide.widthAnchor).isActive = true
        leadingGuide.widthAnchor.constraint(equalTo: trailingGuide.widthAnchor).isActive = true
        
        // vertical positions
        leadingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        middleGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        trailingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        okButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func makeButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.contentEdgeInsets = .init(top: 8, left: 16, bottom: 8, right: 16)
        button.backgroundColor = color
        return button
    }
}

private extension UIColor {
    static let darkBlue = UIColor(red: 10/255, green: 132/255, blue: 255/255, alpha: 1)
    static let darkGreen = UIColor(red: 48/255, green: 209/255, blue: 88/255, alpha: 1)
    static let darkOrange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
    static let darkRed = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1)
    static let darkTeal = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
    static let darkYellow = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
}
