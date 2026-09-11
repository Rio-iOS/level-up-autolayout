import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        let offlineRow = RowView(title: "Offline", isOn: false)
        let offlineSubLabel = makeSubLabel(withText: "When you go offline, you'll only be able to play the music and podcasts you've downloaded.")
        // offlineContainerStackView
        let offlineContainerStackView = makeStackView(spacing: 20)
        offlineContainerStackView.addArrangedSubview(offlineRow)
        offlineContainerStackView.addArrangedSubview(offlineSubLabel)

        // crossFadeView
        let crossFadeView = CrossFadeView()

        let gaplessPlaybackRow = RowView(title: "Gapless Playback", isOn: true)
        let hideSongsRow = RowView(title: "Hide Unplayable Songs", isOn: true)
        let enableNormalizationRow = RowView(title: "Enable Audio Normalization", isOn: true)
        // rowContainerStackView
        let rowContainerStackView = makeStackView(spacing: 32)
        rowContainerStackView.addArrangedSubview(gaplessPlaybackRow)
        rowContainerStackView.addArrangedSubview(hideSongsRow)
        rowContainerStackView.addArrangedSubview(enableNormalizationRow)

        // containerStackView
        let containerStackView = makeStackView(spacing: 32)
        containerStackView.addArrangedSubview(offlineContainerStackView)
        containerStackView.addArrangedSubview(crossFadeView)
        containerStackView.addArrangedSubview(rowContainerStackView)

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(containerStackView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerStackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 20),
            containerStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -20),
            containerStackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            containerStackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -20),
            containerStackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -40),
        ])
    }
}
