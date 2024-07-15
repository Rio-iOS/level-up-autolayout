//
//  BlueView.swift
//  AdaptiveLayoutsChallenge1
//
//  Created by 藤門莉生 on 2024/07/15.
//

import Foundation
import UIKit

class BlueView: UIView {
    private var topAnchorConstraint = NSLayoutConstraint()
    private var centerYAnchorConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: 200, height: 100)
    }
    
    func adjustConstraints() {
        print("✅adjustConstraints()")
        guard let interfaceOrientation = window?.windowScene?.interfaceOrientation else { return }
        if interfaceOrientation.isPortrait {
            print("✅isPortrait")
            topAnchorConstraint.isActive = true
            centerYAnchorConstraint.isActive = false
        } else {
            print("✅isLandscape")
            topAnchorConstraint.isActive = false
            centerYAnchorConstraint.isActive = true
        }
    }
}

private extension BlueView {
    func setupViews() {
        backgroundColor = .blue
        
        let label = makeLabel(withText: "Adjusting constraints", size: 24)
        
        addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        // Dynamic constraints
        topAnchorConstraint = label.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        centerYAnchorConstraint = label.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        adjustConstraints()
    }
}
