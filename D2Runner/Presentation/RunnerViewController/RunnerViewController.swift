//
//  RunnerViewController.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import UIKit
import SnapKit

final class RunnerViewController: UIViewController {
    enum Constants {
        static let stackViewInsets: UIEdgeInsets = .init(top: 16,
                                                         left: 16,
                                                         bottom: 16,
                                                         right: 16)
        static let statusLabelInsets : UIEdgeInsets = .init(top: 8,
                                                            left: 8,
                                                            bottom: 8,
                                                            right: 8)
        static let mainButtonCorner: CGFloat = 12
        static let timerInterval: TimeInterval = 0.01
    }
    
    private let mainButton = UIButton()
    private let statusLabel = UILabel()
    private let presenter: IRunnerViewInput
    private var timer: Timer?
    
    init(presenter: IRunnerViewInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        let stackView = UIStackView()
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(Constants.stackViewInsets)
        }
        stackView.axis = .vertical
        
        setupRoundMainButton()
        
        stackView.addArrangedSubview(createLabelContainer())
        stackView.addArrangedSubview(mainButton)
    }
    
    private func createLabelContainer() -> UIView {
        let container = UIView()
        container.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constants.statusLabelInsets)
        }
        statusLabel.textColor = .black
        statusLabel.text = R.string.localizable.mainButtonStart()
        statusLabel.setContentHuggingPriority(.required, for: .vertical)
        return container
    }
    
    private func setupRoundMainButton() {
        let button = mainButton
        button.backgroundColor = .black
        button.setCornerRadius(Constants.mainButtonCorner)
        button.snp.makeConstraints { make in
            make.height.equalTo(button.snp.width)
        }
        button.setTitle(R.string.localizable.mainButtonStart(),
                        for: .normal)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainButton.setCornerRadius(mainButton.frame.width/2)
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: Constants.timerInterval,
                                     target: self,
                                     selector: #selector(timerSelector),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func timerSelector() {
        
    }
}

extension RunnerViewController: IRunnerViewOutput {
    
}
