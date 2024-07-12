//
//  ViewController.swift
//  ScrollableStackViewsLab
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

class RowView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: 31)
    }
    
    private func setupViews() {
        let titleLabel = makeLabel(withText: "Gapless Playback")
        let onOffSwitch = makeSwitch(isOn: true)
        
        addSubview(titleLabel)
        addSubview(onOffSwitch)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            // onOffSwitch
            onOffSwitch.trailingAnchor.constraint(equalTo: trailingAnchor),
            onOffSwitch.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
        ])
    }
}

private extension ViewController {
    func setupViews() {
        let stackView = makeStackView(withOrientation: .vertical)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = .init(top: 40, leading: 16, bottom: 40, trailing: -16)
        let scrollView = makeScrollView()
        
        
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        
        for i in 1...40 {
            let row = RowView()
            stackView.addArrangedSubview(row)
            
            if i % 5 == 0 {
                stackView.addArrangedSubview(makeSpacerView(height: 4.0))
            }
        }
        

        NSLayoutConstraint.activate([
            // stackview
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            // stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            // NOTE: We need to adjust our width to take into account the extra padding on the side (16x2 = 32)
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1, constant: -32),
            
            // scrollview
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
