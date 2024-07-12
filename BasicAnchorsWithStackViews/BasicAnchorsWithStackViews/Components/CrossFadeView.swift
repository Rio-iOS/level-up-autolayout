//
//  FadeView.swift
//  BasicAnchorsWithStackViews
//
//  Created by 藤門莉生 on 2024/07/12.
//

import Foundation
import UIKit

class CrossFadeView: UIView {
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 300, height: 100)
    }
}

private extension CrossFadeView {
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        let crossfadeLabel = makeBoldLabel(withText: "Crossfade")
        let crossfadeMinLabel = makeSubLabel(withText: "0s")
        let progressView = makeProgressView()
        let crossfadeMaxLabel = makeSubLabel(withText: "12s")
        
        let stackView = makeStackView(spacing: 8.0, axis: .horizontal, alignment: .center)

        stackView.addArrangedSubview(crossfadeMinLabel)
        stackView.addArrangedSubview(progressView)
        stackView.addArrangedSubview(crossfadeMaxLabel)
        
        addSubview(crossfadeLabel)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            // crossfadeLabel
            crossfadeLabel.topAnchor.constraint(equalTo: topAnchor),
            crossfadeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            crossfadeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // stackView
            stackView.topAnchor.constraint(equalTo: crossfadeLabel.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
