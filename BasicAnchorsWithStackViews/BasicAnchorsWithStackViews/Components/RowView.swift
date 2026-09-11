import Foundation
import UIKit

/// タイトルとスイッチを横に並べる、Stack View 向けのレイアウト教材。
final class RowView: UIView {
    init(title: String, isOn: Bool) {
        super.init(frame: .zero)
        setupViews(title: title, isOn: isOn)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// 教材で使う基準サイズ。実際の配置サイズは周囲の制約と優先度によって決まります。
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: 31)
    }
}

private extension RowView {
    func setupViews(title: String, isOn: Bool) {
        translatesAutoresizingMaskIntoConstraints = false

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
