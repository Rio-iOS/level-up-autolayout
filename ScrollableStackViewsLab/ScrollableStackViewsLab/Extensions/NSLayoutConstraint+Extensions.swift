import Foundation
import UIKit

extension NSLayoutConstraint {
    @objc func setActivateBreakable(priority: UILayoutPriority = .init(900)) {
        self.priority = priority
        isActive = true
    }
}
