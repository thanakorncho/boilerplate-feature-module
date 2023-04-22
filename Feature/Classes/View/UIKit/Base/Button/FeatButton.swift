//
//  FeatButton.swift

//
//  Created by KniGht ThanaKorn on 14/3/22.
//

import UIKit

class FeatButton: UIButton {

    enum Style {
        case plainPrimary
        case main
        case secondary
        case tertiary
        case quaternary
    }

    // MARK: - UI
    private var notifyView: UIView?
    private var badgeView: BadgeView?

    // MARK: - Constants
    private var ratio = 1.0 / 1.0
    var isRounded: Bool = true
    var isGradient: Bool = false

    var defaultBackgroundColor: UIColor?
    var backgroundColorForNormal: UIColor?
    var backgroundColorForDisabled: UIColor?
    var backgroundColorForSelected: UIColor?

    // Border
    var defaultBorderColor: UIColor?
    var borderColorForNormal: UIColor?
    var borderColorForDisabled: UIColor?
    var borderColorForSelected: UIColor?

    // Tint Color
    var tintColorForNormal: UIColor?
    var tintColorForDisabled: UIColor?
    var tintColorForSelected: UIColor?

    // Gradient
    var gradient: CommonView.Gradient?

    // Badge
    var badgeStyle: [CommonView.Style.Label]?

    // Round Corners
    var roundCorner: CommonView.RoundedCorner?

    // Progress
    var backgrounCircle: ProgressView?
    var currentProgress: Float = 0.0

    // MARK: - Data Source
    var style: Style? {
        didSet {
            setupStyle()
        }
    }

    // MARK: - Setter
    var textFont: UIFont! {
        didSet {
            titleLabel?.font = textFont
        }
    }

    var isNotify: Bool = false {
        didSet {
            displayNotifyView(isNotify)
        }
    }

    var badge: Int? {
        didSet {
            displayBadgeView(badge)
        }
    }

    var isShowProgress: Bool = false {
        didSet {
            displayProgressView(isShow: isShowProgress)
        }
    }

    // MARK: - Cycle
    convenience init() {
        self.init(type: .custom)
        self.frame = .zero
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        preformRoundedCorner()
        performBackgroundGradient()
        performRoundedWithBorderNotify()
    }

    //    override var imageForNormal: UIImage? {
    //        didSet {
    //            if let imageForNormal = imageForNormal {
    //                imageForHighlighted = imageForNormal.original.tint(
    //                    FeatColor.white.color,
    //                    blendMode: .destinationIn)
    //            } else {
    //                imageForHighlighted = nil
    //            }
    //        }
    //    }

    override  var state: UIControl.State {
        stateHandler(super.state)
        return super.state
    }

    // MARK: - Setup
    private func setup() {
        setupProperties()
        setupHierarchies()
        setupConstraints()
        setupLocalizes()
        setupStyle()
    }

    private func setupProperties() {
        titleColorForHighlighted = ThemeColor.tint
        contentEdgeInsets = .init(
            horizontal: 16,
            vertical: 16)
    }

    private func setupHierarchies() {
    }

    private func setupConstraints() {
    }

    private func setupLocalizes() {
    }

    func setupStyle() {
        guard let style = style else {
            return
        }

        switch style {
        case .main:
            //            gradient = .init(
            //                fromToColors: ThemeColor.button,
            //                locations: [0, 0.53, 1.0],
            //                direction: .topRightToBottomLeft)
            backgroundColorForDisabled = ThemeColor.disable
            makeContentEdgeInsets(
                top: 12,
                left: 16,
                bottom: 12,
                right: 16)
            isGradient = true

        case .secondary:
            makeFilled(backgroundColor: ThemeColor.overlayBackground)

        case .plainPrimary:
            makeFilled(backgroundColor: ThemeColor.primary)

        case .tertiary:
            //            gradient = .init(
            //                fromToColors: ThemeColor.background,
            //                locations: nil,
            //                direction: .topToBottom)
            backgroundColorForDisabled = ThemeColor.disable
            titleColorForNormal = ThemeColor.text
            makeContentEdgeInsets(
                top: 12,
                left: 16,
                bottom: 12,
                right: 16)
            isGradient = true

        case .quaternary:
            makeFilled(backgroundColor: ThemeColor.background)

        default:
            break
        }
    }

    private func stateHandler(_ state: State) {
        switch state {
        case .normal:
            normalStateAction()

        case .selected:
            selectedStateAction()

        case .reserved:
            break

        case .disabled:
            disabledStateAction()

        case .highlighted:
            break

        case .focused:
            break

        default:
            defaultStateAction()
        }
    }

    func normalStateAction() {
        normalState()
    }

    func selectedStateAction() {
        selectedState()
    }

    func disabledStateAction() {
        disabledState()
    }

    func defaultStateAction() {
        defaultState()
    }

    private func normalState() {
        if let backgroundColorForNormal = backgroundColorForNormal {
            backgroundColor = backgroundColorForNormal
        }

        if let borderColorForNormal = borderColorForNormal {
            borderColor = borderColorForNormal
        }

        if let tintColorForNormal = tintColorForNormal {
            tintColor = tintColorForNormal
        }
    }

    private func selectedState() {
        if let backgroundColorForSelected = backgroundColorForSelected {
            backgroundColor = backgroundColorForSelected
        }

        if let borderColorForSelected = borderColorForSelected {
            borderColor = borderColorForSelected
        }

        if let tintColorForSelected = tintColorForSelected {
            tintColor = tintColorForSelected
        }
    }

    private func disabledState() {
        if let backgroundColorForDisabled = backgroundColorForDisabled {
            backgroundColor = backgroundColorForDisabled
        }

        if let borderColorForDisabled = borderColorForDisabled {
            borderColor = borderColorForDisabled
        }

        if let tintColorForDisabled = tintColorForDisabled {
            tintColor = tintColorForDisabled
        }
    }

    private func defaultState() {
        if let defaultBackgroundColor = defaultBackgroundColor {
            backgroundColor = defaultBackgroundColor
        }

        if let defaultBorderColor = defaultBorderColor {
            borderColor = defaultBorderColor
        }
    }
}

// MARK: - Helper
extension FeatButton {
    private func displayNotifyView(_ isNotify: Bool) {
        if let notifyView = notifyView {
            notifyView.isHidden = isNotify.not
        } else {
            makeNotifyView(isNotify)
        }
    }

    private func displayBadgeView(_ badge: Int?) {
        guard let badge = badge, badge.isPositive else {
            badgeView?.removeFromSuperview()
            badgeView = nil
            return
        }

        guard let badgeView = badgeView else {
            makeBadgeView(badge)
            return
        }

        let displayed = BadgeView.Displayed(
            counter: badge,
            style: badgeStyle)
        badgeView.setupDisplayed(displayed)
    }

    private func displayProgressView(isShow: Bool) {
        guard let circleView = backgrounCircle else {
            if isShow {
                makeProgressView()
            }

            return
        }

        circleView.isHidden = !isShow
    }

    private func preformRoundedCorner() {
        if let roundCorner = roundCorner,
           let corners = roundCorner.corners?.rectCorner,
           isRounded {
            roundCorners(
                corners,
                radius: roundCorner.cornerRadius,
                isBorder: roundCorner.isBorder)
        } else if isRounded {
            roundCorners()
        } else {
            removeRoundedCorners()
        }
    }

    private func performRoundedWithBorderNotify() {
        if let notifyView = notifyView {
            notifyView.roundCorners()
            notifyView.borderColor = .white
            notifyView.borderWidth = 1
        }
    }

    private func performBackgroundGradient() {
        if let gradient = gradient, isGradient {
            self.gradient(gradient)
        } else {
            self.removeGradient()
        }
    }

    private func makeBadgeView(_ counter: Int) {
        let view = BadgeView()
        let displayed = BadgeView.Displayed(
            counter: counter,
            style: badgeStyle)
        view.setupDisplayed(displayed)
        addSubview(view)
        view.snp.makeConstraints({ make in
            make.centerY.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview().offset(10)
            make.width.aspectRatioToSelf(
                view.snp.height,
                1.0 / 1.0)
        })
        view.layoutIfNeeded()
        badgeView = view
    }

    private func makeNotifyView(_ isNotify: Bool) {
        let view: UIView = .init(frame: .zero)
        view.backgroundColor = ThemeColor.link
        view.isHidden = isNotify.not
        makeConstraintsNotifyView(view)
        view.layoutIfNeeded()
        notifyView = view
    }

    private func makeConstraintsNotifyView(_ view: UIView) {
        addSubview(view)
        view.snp.makeConstraints({ make in
            make.top.right.equalToSuperview()
            make.width.aspectRatioToSelf(view.snp.height, ratio)
            make.width.equalTo(8)
        })
    }

    private func makeProgressView() {
        let view = ProgressView(frame: self.frame)
        addSubview(view)
        view.snp.makeConstraints({ make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            make.center.equalToSuperview()
        })
        view.layoutIfNeeded()
        backgrounCircle = view
    }
}

// MARK: - Common
extension FeatButton {

    func clearAllEdgeInsets() {
        clearContentEdgeInsets()
        clearImageEdgeInsets()
    }

    func makeContentEdgeInsets(
        top: CGFloat? = nil,
        left: CGFloat? = nil,
        bottom: CGFloat? = nil,
        right: CGFloat? = nil
    ) {
        contentEdgeInsets = .init(
            top: top ?? .zero,
            left: left ?? .zero,
            bottom: bottom ?? .zero,
            right: right ?? .zero)
    }

    func clearContentEdgeInsets() {
        contentEdgeInsets = .zero
    }

    func makeImageEdgeInsets(
        top: CGFloat? = nil,
        left: CGFloat? = nil,
        bottom: CGFloat? = nil,
        right: CGFloat? = nil
    ) {
        imageEdgeInsets = .init(
            top: top ?? .zero,
            left: left ?? .zero,
            bottom: bottom ?? .zero,
            right: right ?? .zero)
    }

    func clearImageEdgeInsets() {
        imageEdgeInsets = .zero
    }

    func makeFilled(backgroundColor: UIColor) {
        defaultBackgroundColor = backgroundColor
        backgroundColorForNormal = backgroundColor
        self.backgroundColor = backgroundColor
        self.borderColor = nil
        self.borderWidth = 0
    }

    func makeOutlined(
        borderColor: UIColor?,
        borderWidth: CGFloat = 1
    ) {
        self.backgroundColor = .clear
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }

    func makeTransparent() {
        self.backgroundColor = .clear
    }
}

// MARK: - Animation
extension FeatButton {
    func animateScaling(
        withDuration: CGFloat = 0.18,
        transform: CGAffineTransform = .init(scaleX: 0.85, y: 0.85)
    ) {
        func end() {
            UIView.animate(
                withDuration: withDuration,
                animations: {
                    self.transform = .identity
                    self.roundCorners()
                },
                completion: { [weak self] finished in
                    if finished {
                        self?.layoutIfNeeded()
                    }
                })
        }

        UIView.animate(
            withDuration: withDuration,
            animations: {
                self.transform = transform
            },
            completion: { [weak self] finished in
                if finished {
                    end()
                }
            })
    }
}

// MARK: - Progress View
extension FeatButton {
    func updateCircleProgress(progress: Float) {
        if currentProgress >= 1 && progress == 0 {
            stopCircleProgress()
        } else {
            backgrounCircle?.setProgressWithAnimation(duration: 1, value: progress, fromValue: currentProgress)
        }
        currentProgress = progress
    }

    func stopCircleProgress() {
        backgrounCircle?.setProgressWithAnimation(duration: 1, value: 0, fromValue: 0)
        currentProgress = 0
    }

    func setupCircleView() {
        backgrounCircle?.layoutIfNeeded()
    }
}
