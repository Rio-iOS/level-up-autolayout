//
//  AdjustConstraintsBlueView.swift
//  AdaptiveLayoutsAdjustSpacerLab
//
//  Created by 藤門莉生 on 2024/07/15.
//

import Foundation
import UIKit

class AdjustSpacerBlueView: UIView {
    private let topSpacer = makeSpacerView(height: 100)
    private let bottomSpacer = makeSpacerView(height: 100)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func adjustConstraints() {
        guard let interfaceOrientation = window?.windowScene?.interfaceOrientation else { return }
        
        print("✅ \(interfaceOrientation)")
        if interfaceOrientation.isPortrait {
            topSpacer.isHidden = true
            bottomSpacer.isHidden = true
        } else {
            topSpacer.isHidden = false
            bottomSpacer.isHidden = false
        }
    }
}

private extension AdjustSpacerBlueView {
    func setupViews() {
        backgroundColor = .blue
        topSpacer.backgroundColor = .white
        bottomSpacer.backgroundColor = .white
        
        let label = makeLabel(withText: "Adjusting via spacers", size: 24)
        let stackView = makeStackView(withOrientation: .vertical)
        
        stackView.addArrangedSubview(topSpacer)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(bottomSpacer)
        
        addSubview(stackView)
       
        NSLayoutConstraint.activate([
            topSpacer.heightAnchor.constraint(equalTo: bottomSpacer.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
       
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        
        adjustConstraints()
    }
}
