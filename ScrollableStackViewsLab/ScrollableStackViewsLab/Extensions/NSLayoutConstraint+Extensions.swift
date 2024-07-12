//
//  NSLayoutConstraint+Extensions.swift
//  ScrollableStackViewsLab
//
//  Created by 藤門莉生 on 2024/07/12.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    @objc func setActivateBreakable(priority: UILayoutPriority = .init(900)) {
        self.priority = priority
        isActive = true
    }
}
