//
//  BlueView.swift
//  AdaptiveLayoutsOrientationLab
//
//  Created by 藤門莉生 on 2024/07/15.
//

import Foundation
import UIKit

final class BlueView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: 100)
    }
}

private extension BlueView {
    func setupViews() {
        backgroundColor = .blue
    }
}
