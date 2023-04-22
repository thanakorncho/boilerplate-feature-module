//
//  FeatLiveSwitch.swift
//  Joy
//
//  Created by Thanakorn Chongcharoenthanakul on 1/3/2566 BE.
//  Copyright © 2566 BE ookbee. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - Alias

public final class FeatLiveSwitch: UIControl {

    // MARK: - Alias
    public typealias View = CommonView

    public struct Configuration {
        public var control: View.Switch.Control?
        public var labels: View.Switch.Label?
        public var thumb: View.Switch.Thumb?

        public init(control: View.Switch.Control? = nil, labels: View.Switch.Label? = nil, thumb: View.Switch.Thumb? = nil) {
            self.control = control
            self.labels = labels
            self.thumb = thumb
        }
    }

    // MARK: - UI
    private var thumbView: FeatThumbView = .init()
    private var labelStackView: HorizontalStackView = .init()
    private var offView: FeatView = .init()
    private var onView: FeatView = .init()
    private var offLabel: FeatLabel = .init()
    private var onLabel: FeatLabel = .init()

    // MARK: - Constants
    public var isOn: Bool = false
    var animateDuration: Double = 0.6
    var cornerRadiusScale: CGFloat?
    private var padding: CGFloat = 3
    private var disposeBag = DisposeBag()

    // MARK: - Event
    public var onChanged: ((Bool) -> Void)?

    // MARK: - Data source
    public var thumbImage: UIImage? {
        didSet {
            setupThumbImage(thumbImage)
        }
    }

    public var offText: String? {
        didSet {
            offLabel.text = offText
        }
    }

   public var onText: String? {
        didSet {
            onLabel.text = onText
        }
    }

    public var configuration: Configuration? {
        didSet {
            setupConfiguration(configuration)
        }
    }

    // MARK: - Life cycle
    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        if let cornerRadiusScale = cornerRadiusScale {
            withRoundedCorners(radius: bounds.size.height * cornerRadiusScale)
        } else {
            withRoundedCorners()
        }
    }

    public override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        toggle()
        return true
    }

    private func setup() {
        setupProperties()
        setupHierarchies()
        setupConstraints()
        setupLocalizes()
        setupEvent()
        setupAccessibilityIds()
    }

    private func setupProperties() {
        clipsToBounds = false
        updateView()
    }

    private func setupHierarchies() {
        addSubview(thumbView)
    }

    private func setupConstraints() {
        thumbView.snp.makeConstraints({ make in
            make.width.equalTo(thumbView.snp.height).multipliedBy(1.0 / 1.0)
            make.height.equalToSuperview().inset(padding)
            make.centerY.equalToSuperview()
        })
    }

    private func setupLocalizes() {
    }

    private func setupEvent() {
        self.rx.controlEvent(.valueChanged)
            .debug()
            .subscribe(with: self, onNext: { owner, _ in
                owner.onChanged?(owner.isOn)
            })
            .disposed(by: disposeBag)
    }

    private func setupAccessibilityIds() {
    }

    private func setupConfiguration(_ config: Configuration?) {
        guard let config = config else { return }
        setupLabels(config.labels)
        setupThumb(config.thumb)
        setupControl(config.control)
    }

    public func setOn(on: Bool, animated: Bool = true) {
        switch animated {
        case true:
            action(on)
            animating()

        case false:
            action(on)
            updateView()
            completed()
        }
    }

    private func toggle() {
        Vibration.success.vibrate()
        action()
        animating()
    }

    private func action(_ isOn: Bool? = nil) {
        if let isOn = isOn {
            self.isOn = isOn
        } else {
            self.isOn.toggle()
        }
    }

    private func updateView() {
        updateControl()
        updateThumb()
        updateLabels()
    }

    private func animating() {
        animate(animations: { [weak self] in
            self?.updateView()
        }, completion: { [weak self] _ in
            self?.completed()
        })
    }

    private func completed() {
        sendActions(for: .valueChanged)
    }
}

// MARK: - Control
extension FeatLiveSwitch {
    private func setupControl(_ control: View.Switch.Control? = nil) {
        guard let control = control else { return }
        control.backgroundColor.setupBackgroundColor(self, isOn: isOn)
    }

    private func updateControl() {
        if let control = configuration?.control {
            control.backgroundColor.setupBackgroundColor(self, isOn: isOn)
        } else {
            backgroundColor = .black
        }
    }
}

// MARK: - Labels
extension FeatLiveSwitch {
    private func setupLabels(_ labels: View.Switch.Label? = nil) {
        labelStackView.distribution = .fillEqually
        labelStackView.axis = .horizontal
        labelStackView.isUserInteractionEnabled = false
        onLabel.backgroundColor = .clear
        offLabel.backgroundColor = .clear
        onLabel.isUserInteractionEnabled = false
        offLabel.isUserInteractionEnabled = false
        setupLabelHierarchies()
        setupLabelConstraints()

        guard let labels = labels else { return }
        setupLabelProperties(labels)
    }

    private func setupLabelHierarchies() {
        onView.addSubview(onLabel)
        offView.addSubview(offLabel)
        labelStackView.addArrangedSubview(onView)
        labelStackView.addArrangedSubview(offView)
        insertSubview(labelStackView, belowSubview: thumbView)
    }

    private func setupLabelConstraints() {
        labelStackView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        onLabel.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        offLabel.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
    }

    private func setupLabelProperties(_ labels: View.Switch.Label) {
        updateLabels()
        labels.textColors.setupTextColor(
            onLabel: onLabel,
            offLabel: offLabel)
        labels.textAlignments.setup(
            onLabel: onLabel,
            offLabel: offLabel)
        labels.fonts.setupTextFont(
            onLabel: onLabel,
            offLabel: offLabel)
    }

    private func updateLabels() {
        offLabel.isHidden = isOn
        onLabel.isHidden = !isOn
    }
}

// MARK: - Thumb
extension FeatLiveSwitch {
    private func setupThumb(_ thumb: View.Switch.Thumb? = nil) {
        thumbView.backgroundColor = .white
        thumbView.showShadow = true
        thumbView.shadowOffset = .init(width: 1, height: 1)
        thumbView.shadowColor = .black

        guard let thumb = thumb else { return }
        setupThumbProperties(thumb)
    }

    private func setupThumbProperties(_ thumb: View.Switch.Thumb) {
        thumb.backgroundColor.setupBackgroundColor(thumbView, isOn: isOn)
        thumb.tintColor.setupThumbTintColor(thumbView)
    }

    private func setupThumbImage(_ image: UIImage?) {
        thumbView.image = image
    }

    private func updateThumb() {
        let onPointX = bounds.width - thumbView.bounds.width - padding
        let originX = isOn ? onPointX : padding
        thumbView.frame.origin.x = originX
        thumbView.setNeedsLayout()
        thumbView.layoutIfNeeded()
    }
}

// MARK: - Helper
extension FeatLiveSwitch {
    private func clear() {
        labelStackView.removeFromSuperview()
    }

    private func animate(
        animations: @escaping () -> Void,
        completion: ((Bool) -> Void)? = nil
    ) {
        UIView.animate(
            withDuration: animateDuration,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5,
            options: [
                .curveEaseOut,
                .beginFromCurrentState,
                .allowUserInteraction
            ], animations: animations,
            completion: completion)
    }
}

// MARK: - Private Extension
private extension Dictionary where Key == CommonView.Switch.State, Value == UIColor {
    func setupTextColor(onLabel: UILabel, offLabel: UILabel) {
        self.forEach { key, value in
            switch key {
            case .on:
                onLabel.textColor = value

            case .off:
                offLabel.textColor = value

            case .all:
                onLabel.textColor = value
                offLabel.textColor = value
            }
        }
    }

    func setupThumbTintColor(_ thumb: FeatThumbView) {
        self.forEach { key, value in
            switch key {
            case .on:
                thumb.imageTintColor = value

            case .off:
                thumb.imageTintColor = value

            default:
                break
            }
        }
    }

    func setupBackgroundColor(_ view: UIView, isOn: Bool) {
        self.forEach { key, value in
            switch key {
            case .on where isOn:
                view.backgroundColor = value

            case .off where !isOn:
                view.backgroundColor = value

            default:
                break
            }
        }
    }
}

private extension Dictionary where Key == CommonView.Switch.State, Value == UIFont {
    func setupTextFont(onLabel: UILabel, offLabel: UILabel) {
        self.forEach { key, value in
            switch key {
            case .on:
                onLabel.font = value

            case .off:
                offLabel.font = value

            case .all:
                onLabel.font = value
                offLabel.font = value
            }
        }
    }
}

private extension Dictionary where Key == CommonView.Switch.State, Value == NSTextAlignment {
    func setup(onLabel: UILabel, offLabel: UILabel) {
        self.forEach { key, value in
            switch key {
            case .on:
                onLabel.textAlignment = value

            case .off:
                offLabel.textAlignment = value

            case .all:
                onLabel.textAlignment = value
                offLabel.textAlignment = value
            }
        }
    }
}
