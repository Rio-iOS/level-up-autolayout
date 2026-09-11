import XCTest
@testable import BasicAnchorsWithStackViews

final class AdaptiveRowTests: XCTestCase {
    @MainActor func testShortScreenCanScrollToAllSettings() throws {
        let controller = ViewController()
        controller.loadViewIfNeeded()
        controller.view.frame = CGRect(x: 0, y: 0, width: 280, height: 240)
        controller.view.layoutIfNeeded()
        let scrollView = try XCTUnwrap(controller.view.subviews.compactMap { $0 as? UIScrollView }.first)
        XCTAssertGreaterThan(scrollView.contentSize.height, scrollView.bounds.height)
        XCTAssertEqual(scrollView.contentSize.width, scrollView.bounds.width, accuracy: 0.5)
    }

    @MainActor func testLongTitleWrapsAndSwitchRetainsItsIntrinsicWidth() throws {
        let row = RowView(title: "Enable audio normalization for every downloaded song", isOn: true)
        let toggle = try XCTUnwrap(row.subviews.compactMap { $0 as? UISwitch }.first)
        let label = try XCTUnwrap(row.subviews.compactMap { $0 as? UILabel }.first)
        let narrow = row.systemLayoutSizeFitting(CGSize(width: 200, height: 0), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        let wide = row.systemLayoutSizeFitting(CGSize(width: 600, height: 0), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        XCTAssertGreaterThan(narrow.height, wide.height)
        row.frame = CGRect(origin: .zero, size: narrow)
        row.layoutIfNeeded()
        XCTAssertGreaterThanOrEqual(toggle.frame.width, toggle.intrinsicContentSize.width - 0.5)
        XCTAssertLessThanOrEqual(label.frame.maxX + 12, toggle.frame.minX + 0.5)
        XCTAssertTrue(toggle.isOn)
        XCTAssertEqual(toggle.accessibilityLabel, label.text)
        XCTAssertFalse(row.hasAmbiguousLayout)
    }

    @MainActor func testAccessibilityTextCanExpandRowBeyondOriginalFixedHeight() {
        UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge).performAsCurrent {
            let row = RowView(title: "Enable Audio Normalization", isOn: false)
            let size = row.systemLayoutSizeFitting(CGSize(width: 280, height: 0), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
            XCTAssertGreaterThan(size.height, 31)
        }
    }
}
