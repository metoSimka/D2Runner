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
    private let timerRow = RunnerInfoRowView(titleRow: R.string.localizable.runnerTimerTitle())
    private let runCountRow = RunnerInfoRowView(titleRow: R.string.localizable.runnerCountTitle())
    private let averageRow = RunnerInfoRowView(titleRow: R.string.localizable.runnerAverageTitle())
    private let fastestRow = RunnerInfoRowView(titleRow: R.string.localizable.runnerFastestTitle())
    private let presenter: IRunnerViewOutput
    
    private var runData: RunData = .init(runList: [])
    private var state: State = .stopped
    private var timer: Timer?
    private var timerCount: TimeInterval = 0 {
        didSet {
            let y = Double(round(10 * timerCount) / 10)
            timerRow.updateValueView(y)
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
    }
    
    private func setupUI() {
        let stackView = UIStackView()
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(Constants.stackViewInsets)
        }
        stackView.axis = .vertical
        stackView.addArrangedSubview(createHeaderLabelContainer())
        stackView.addArrangedSubview(timerRow)
        stackView.addArrangedSubview(runCountRow)
        stackView.addArrangedSubview(fastestRow)
        stackView.addArrangedSubview(averageRow)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(createStopButtonContainer())
        stackView.addArrangedSubview(mainButton)
       
        setupRoundMainButton()
        mainButton.addTarget(self,
                             action: #selector(startButtonTapped),
                             for: .touchUpInside)
        stopButton.addTarget(self,
                             action: #selector(stopButtonTapped),
                             for: .touchUpInside)
    }
   
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainButton.setCornerRadius(mainButton.frame.width/2)
    }
    
    private func startTimer() {
        timerCount = 0
        timer?.invalidate()
        timer = nil
        state = .run
        timer = Timer.scheduledTimer(timeInterval: Constants.timerInterval,
                                     target: self,
                                     selector: #selector(timerSelector),
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc private func timerSelector() {
        timerCount += Constants.timerInterval
    }
    
    @objc private func stopButtonTapped() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func startButtonTapped() {
        switch state {
        case .stopped:
            startTimer()
        case .run:
            runData.appendRun(timeInterval: timerCount)
            startTimer()
            updateLabels(with: runData)
        }
        startTimer()
    }
    
    private func updateLabels(with runData: RunData) {
        runCountRow.updateValueView(runData.count)
        averageRow.updateValueView(runData.averageTime)
        fastestRow.updateValueView(runData.fastestTime)
    }
}

extension RunnerViewController: IRunnerViewInput {
}

// setup UI
private extension RunnerViewController {
    private func createDestinationRow(view1: UIView, view2: UIView) -> UIView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        return stackView
    }
    
    private func createHeaderLabelContainer() -> UIView {
        let label = headerLabel
        let container = ContainerFactory.container(label)
        label.textColor = .D2Color.n0
        label.text = R.string.localizable.runnerButtonStart()
        label.setContentHuggingPriority(.required, for: .vertical)
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
