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
        static let statusLabelInsets: UIEdgeInsets = .init(top: 8,
                                                            left: 8,
                                                            bottom: 8,
                                                            right: 8)
        static let stopButtonInsets: UIEdgeInsets = .init(top: 16,
                                                          left: 16,
                                                          bottom: 32,
                                                          right: 16)
        static let stopButtonCorner: CGFloat = 12
        static let timerInterval: TimeInterval = 0.01
    }
    
    enum State {
        case stopped
        case run
    }
    
    private let mainButton = UIButton()
    private let stopButton = D2Button(title: R.string.localizable.runnerButtonStop(),
                                      style: .medium.black)
    private let headerLabel = UILabel()
    private let timerLabel = UILabel()
    private let destinationLabel = UILabel()
    private let presenter: IRunnerViewOutput
    
    private var state: State = .stopped
    private var timer: Timer?
    private var runDataList: [TimeInterval] = []
    private var timerCount: TimeInterval = 0 {
        didSet {
            let y = Double(round(10 * timerCount) / 10)
            self.timerLabel.text = "\(y)"
        }
    }
    
    init(presenter: IRunnerViewOutput) {
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
        presenter.onViewDidLoad()
        
        mainButton.addTarget(self,
                             action: #selector(startButtonTapped),
                             for: .touchUpInside)
    }
    
    private func setupUI() {
        let stackView = UIStackView()
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(Constants.stackViewInsets)
        }
        stackView.axis = .vertical
        stackView.addArrangedSubview(createHeaderLabelContainer())
        stackView.addArrangedSubview(createDestinationRow())
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(createStopButtonContainer())
        stackView.addArrangedSubview(mainButton)
       
        setupRoundMainButton()
    }
   
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainButton.setCornerRadius(mainButton.frame.width/2)
    }
    
    private func startTimer() {
        timerCount = 0
        timer?.invalidate()
        timer = nil
        timer = Timer.scheduledTimer(timeInterval: Constants.timerInterval,
                                     target: self,
                                     selector: #selector(timerSelector),
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc private func timerSelector() {
        timerCount += Constants.timerInterval
    }
    
    @objc private func startButtonTapped() {
        switch state {
        case .stopped:
            startTimer()
        case .run:
            runDataList.append(timerCount)
            startTimer()
        }
        startTimer()
    }
}

extension RunnerViewController: IRunnerViewInput {
    func updateDestinaionLabel(_ text: String) {
        destinationLabel.text = text
    }
}

// setup UI
private extension RunnerViewController {
    private func createDestinationRow() -> UIView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(createDestinationLabelContainer())
        stackView.addArrangedSubview(createTimerLabelContainer())
        return stackView
    }
    
    private func createTimerLabelContainer() -> UIView {
        let container = ContainerFactory.container(timerLabel)
        timerLabel.textAlignment = .left
        timerLabel.font = .D2Font.bold(size: 20)
        return container
    }

    private func createHeaderLabelContainer() -> UIView {
        let label = headerLabel
        let container = ContainerFactory.container(label)
        label.textColor = .D2Color.n0
        label.text = R.string.localizable.runnerButtonStart()
        label.setContentHuggingPriority(.required, for: .vertical)
        return container
    }
    
    private func createDestinationLabelContainer() -> UIView {
        let container = ContainerFactory.container(destinationLabel)
        return container
        
    }
    private func setupRoundMainButton() {
        let button = mainButton
        button.backgroundColor = .D2Color.n0
        button.snp.makeConstraints { make in
            make.height.equalTo(button.snp.width)
        }
        button.setTitle(R.string.localizable.runnerButtonStart(),
                        for: .normal)
    }
    
    private func createStopButtonContainer() -> UIView {
        let container = ContainerFactory.container(stopButton, insets: Constants.stopButtonInsets)
        return container
    }
}
