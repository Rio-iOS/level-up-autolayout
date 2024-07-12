//
//  RowView.swift
//  BasicAnchorsWithStackViews
//
//  Created by 藤門莉生 on 2024/07/12.
//

import Foundation
import UIKit

class RowView: UIView {
    init(title: String, isOn: Bool) {
        super.init(frame: .zero)
        setupViews(title: title, isOn: isOn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: 31)
    }
}

private extension RowView {
    func setupViews(title: String, isOn: Bool) {
        let titleLabel = makeLabel(withText: title)
        let onOffSwitch = makeSwitch(isOn: isOn)
        
        addSubview(titleLabel)
        addSubview(onOffSwitch)
        
        NSLayoutConstraint.activate([
            // titleLabel
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            // onOffSwitch
            onOffSwitch.trailingAnchor.constraint(equalTo: trailingAnchor),
            onOffSwitch.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
        ])
    }
}
