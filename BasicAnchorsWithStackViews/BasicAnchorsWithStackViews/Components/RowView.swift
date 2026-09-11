import UIKit

/// 複数行のタイトルとスイッチを、文字サイズに応じた高さで並べます。
final class RowView: UIView {
    private let titleLabel = UILabel()
    private let toggle = UISwitch()

    init(title: String, isOn: Bool) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.font = .preferredFont(forTextStyle: .body)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        toggle.isOn = isOn
        toggle.accessibilityLabel = title
        toggle.setContentHuggingPriority(.required, for: .horizontal)
        toggle.setContentCompressionResistancePriority(.required, for: .horizontal)
        titleLabel.isAccessibilityElement = false
        [titleLabel, toggle].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            toggle.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 12),
            toggle.trailingAnchor.constraint(equalTo: trailingAnchor),
            toggle.centerYAnchor.constraint(equalTo: centerYAnchor),
            heightAnchor.constraint(greaterThanOrEqualTo: toggle.heightAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("Use init(title:isOn:)")
    }
}
