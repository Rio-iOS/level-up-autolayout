//
//  ViewController.swift
//  StackViewLab
//
//  Created by 藤門莉生 on 2024/07/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        navigationItem.title = "CHCR Fill"
        
        let stackView = makeStackView(withOrientation: .vertical)
        stackView.distribution = .fill
        
        let bigLabel = makeLabel(withText: "Big", size: 128, color: .yellow)
        let mediumLabel = makeLabel(withText: "Medium", size: 64, color: .orange)
        let smallLabel = makeLabel(withText: "Small", size: 32, color: .green)
        
        stackView.addArrangedSubview(mediumLabel)
        stackView.addArrangedSubview(bigLabel)
        stackView.addArrangedSubview(smallLabel)
        
        view.addSubview(stackView)
       
        NSLayoutConstraint.activate([
            // 以下のように高さが曖昧なレイアウトになる
            // x-xcode-debug-views:///a0d2a9e80 Height is ambiguous for UILabel - Big.
            // x-xcode-debug-views:///a0d2a9e80 Height and vertical position are ambiguous for UILabel - Medium.
            // x-xcode-debug-views:///a0d2a9e80 Height and vertical position are ambiguous for UILabel - Small.
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // X, Y軸共に中心に配置
//            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
       
        // bigLabelのcontentHuggingPriorityを下げることで、伸びるようになる
        bigLabel.setContentHuggingPriority(.init(249), for: .vertical)
    }
    
    func makeStackView(withOrientation axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        return stackView
    }
    
    func makeLabel(withText text: String, size: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = .boldSystemFont(ofSize: size)
        label.layer.backgroundColor = color.cgColor
        return label
    }
}
