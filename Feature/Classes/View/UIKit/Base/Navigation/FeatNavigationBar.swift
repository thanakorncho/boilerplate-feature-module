//
//  FeatNavigationBar.swift

//
//  Created by KniGht ThanaKorn on 15/3/22.
//

import Foundation
import RxCocoa
import RxSwift

class FeatNavigationBar: UINavigationBar {

    struct Displayed {
        var title: String?
        var buttons: [ButtonType]
        var separator: SeparatorType
    }

    enum ButtonType {
        case normal(Button)
        case custom(ButtonCustom)
    }

    enum SeparatorType {
        case none
        case normal
        case full
    }

    struct ButtonCustom {
        var title: TitleCustom?
        var button: Button?
        var view: UIView?
        var position: Position
    }

    struct TitleCustom {
        let title: String
        var color: UIColor?
        var textAlignment: NSTextAlignment?
    }

    struct Button {
        var title: String?
        var image: UIImage?
        var position: Position?
        var color: UIColor?
        var textFont: UIFont?
        var tintColor: UIColor?

        init(_ style: Style) {
            let image: UIImage
            let position: Position
            switch style {
            case .close:
                image = FeatImage.Common.chevronsLeft.image.template
                position = .right

            case .closeTop:
                image = FeatImage.Common.chevronsLeft.image.template
                position = .rightTop

            case .back:
                image = FeatImage.Common.chevronsLeft.image.template
                position = .left
            }

            self.init(image: image, position: position)
        }

        init(
            title: String? = nil,
            image: UIImage? = nil,
            position: Position? = nil,
            color: UIColor? = nil,
            tintColor: UIColor? = nil,
            textFont: UIFont? = nil
        ) {
            self.title = title
            self.image = image
            self.position = position
            self.color = color
            self.tintColor = tintColor
            self.textFont = textFont
        }
    }

    enum Position {
        case left
        case leftTop
        case right
        case rightTop
    }

    enum Style {
        case close
        case closeTop
        case back
    }

    //    struct Position: OptionSet {
    //        let rawValue: Int
    //
    //        static let left    = Position(rawValue: 1 << 0)
    //        static let right  = Position(rawValue: 1 << 1)
    //
    //        static let all: Position = [.left, .right]
    //    }

    struct Events {
        let onTapLeft: ControlEvent<Void>
        let onTapRight: ControlEvent<Void>
    }

    // MARK: - UI
    private var leftButton: FeatButton = .init()
    private var rightButton: FeatButton = .init()
    private let separatorLineView: UIView = .init(frame: .zero)

    // MARK: - Constants

    // MARK: - Data source
    var events: Events!

    // MARK: - Rx
    private let disposeBag = DisposeBag()
    private let onTapLeftRelay = PublishRelay<Void>()
    private let onTapRightRelay = PublishRelay<Void>()

    // MARK: - Cycle
    convenience init() {
        self.init(frame: .zero)
        self.pushItem(.init(), animated: false)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    // MARK: - Setup
    private func setup() {
        setupProperties()
        setupHierarchies()
        setupConstraints()
        setupLocalizes()
        setupEvent()
    }

    private func setupProperties() {
        setColors(
            background: ThemeColor.background,
            text: ThemeColor.text)
        shadowImage = UIImage()
        separatorLineView.backgroundColor = ThemeColor.overlayBackground
        separatorLineView.isHidden = true
    }

    private func setupHierarchies() {
        addSubview(separatorLineView)
        bringSubviewToFront(separatorLineView)
    }

    private func setupConstraints() {
        separatorLineView.snp.makeConstraints({ make in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        })
    }

    private func setupLocalizes() {
    }

    private func setupEvent() {
        self.events = .init(
            onTapLeft: .init(events: onTapLeftRelay),
            onTapRight: .init(events: onTapRightRelay))
    }

    func setupDisplayed(_ displayed: Displayed? = nil) {
        if let displayed = displayed {
            topItem?.title = displayed.title
            displayed.buttons.forEach({ button in
                switch button {
                case let .normal(button):
                    onCreateButtonProcess(button)

                case let .custom(button):
                    onCreateButtonCustomProcess(button)
                }
            })
            onDisplaySeparatorProcess(displayed.separator)
        } else {
            topItem?.title = nil
            topItem?.leftBarButtonItem = nil
            topItem?.rightBarButtonItem = nil
        }
        setNeedsLayout()
    }

    func setupTitle(_ title: String? = nil) {
        topItem?.title = title
        setNeedsLayout()
    }

    // MARK: - Process
    private func onCreateButtonProcess(_ button: Button) {
        guard let position = button.position else {
            return
        }

        switch position {
        case .left, .leftTop:
            leftButton = makeButton(button, position: position)
            onSetEventButtonProcess(position)
            setLeftButton(leftButton)

        case .right, .rightTop:
            rightButton = makeButton(button, position: position)
            onSetEventButtonProcess(position)
            setRightButton(rightButton)
        }
    }

    private func onSetEventButtonProcess(_ position: Position) {
        switch position {
        case .left, .leftTop:
            leftButton.rx.tap
                .bind(to: onTapLeftRelay)
                .disposed(by: disposeBag)

        case .right, .rightTop:
            rightButton.rx.tap
                .bind(to: onTapRightRelay)
                .disposed(by: disposeBag)
        }
    }

    private func onCreateButtonCustomProcess(_ button: ButtonCustom) {
        var titleView: FeatLabel?
        var buttonView: FeatButton?
        if let titleCustom = button.title, let buttonCustom = button.button {
            titleView = makeTitleLabel(titleCustom)
            buttonView = makeButton(buttonCustom, position: button.position)
        } else if let buttonCustom = button.button {
            buttonView = makeButton(buttonCustom, position: button.position)
        } else if let title = button.title {
            titleView = makeTitleLabel(title)
        }

        switch button.position {
        case .left, .leftTop:
            if let titleView = titleView, let buttonView = buttonView {
                leftButton = buttonView
                onSetEventButtonProcess(button.position)
                setLeftViews([buttonView, titleView])
            } else if let buttonView = buttonView {
                leftButton = buttonView
                onSetEventButtonProcess(button.position)
                setLeftButton(buttonView)
            } else if let view = button.view {
                setLeftView(view)
            } else if let titleView = titleView {
                setLeftView(titleView)
            }

        case .right, .rightTop:
            if let titleView = titleView, let buttonView = buttonView {
                rightButton = buttonView
                onSetEventButtonProcess(button.position)
                setRightViews([buttonView, titleView])
            } else if let buttonView = buttonView {
                rightButton = buttonView
                onSetEventButtonProcess(button.position)
                setRightButton(buttonView)
            } else if let view = button.view {
                setRightView(view)
            } else if let titleView = titleView {
                setRightView(titleView)
            }
        }
    }

    private func onDisplaySeparatorProcess(_ separator: SeparatorType) {
        let isHidden: Bool
        var inset: Int?
        switch separator {
        case .none:
            isHidden = true

        case .normal:
            isHidden = false
            inset = 16

        case .full:
            isHidden = false
            inset = 0
        }

        separatorLineView.isHidden = isHidden
        separatorLineView.snp.makeConstraints({ make in
            guard let inset = inset else { return }
            make.left.right.equalToSuperview().inset(inset)
        })
    }
}

// MARK: - Helper
extension FeatNavigationBar {
    func makeButton(_ button: Button, position: Position) -> FeatButton {
        return makeButton(
            title: button.title,
            image: button.image,
            position: position,
            color: button.color,
            tintColor: button.tintColor,
            textFont: button.textFont)
    }

    func hideButtons(_ positions: [Position]) {
        positions.forEach({ position in
            switch position {
            case .left, .leftTop:
                leftButton.isHidden = true

            case .right, .rightTop:
                rightButton.isHidden = true
            }
        })
    }

    func showButtons(_ positions: [Position]) {
        positions.forEach({ position in
            switch position {
            case .left, .leftTop:
                leftButton.isHidden = false

            case .right, .rightTop:
                rightButton.isHidden = false
            }
        })
    }
}

// MARK: - Common
extension FeatNavigationBar {
    private func setLeftButton(_ button: UIButton) {
        topItem?.setLeftBarButton(
            .init(customView: button),
            animated: true)
    }

    private func setLeftView(_ view: UIView) {
        topItem?.setLeftBarButton(
            .init(customView: view),
            animated: true)
    }

    private func setLeftViews(_ views: [UIView]) {
        let items = views.toBarButtonItems()
        topItem?.setLeftBarButtonItems(items, animated: true)
    }

    private func setRightButton(_ button: UIButton) {
        topItem?.setRightBarButton(
            .init(customView: button),
            animated: true)
    }

    private func setRightView(_ view: UIView) {
        topItem?.setRightBarButton(
            .init(customView: view),
            animated: true)
    }

    private func setRightViews(_ views: [UIView]) {
        let items = views.toBarButtonItems()
        topItem?.setRightBarButtonItems(items, animated: true)
    }

    private func makeButton(
        title: String?,
        image: UIImage?,
        position: Position,
        color: UIColor?,
        tintColor: UIColor?,
        textFont: UIFont?
    ) -> FeatButton {
        let frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: 0.0,
            height: .greatestFiniteMagnitude)
        let button = FeatButton()
        button.frame = frame
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = tintColor ?? ThemeColor.primary
        button.titleColorForNormal = color
        if let title = title, let image = image?.template {
            button.titleForNormal = title
            button.imageForNormal = image
        } else if let title = title {
            button.titleForNormal = title
        } else if let image = image?.template {
            button.imageForNormal = image
        }

        if let textFont = button.textFont {
            button.textFont = textFont
        }

        var bottom: CGFloat = .zero
        var left: CGFloat = .zero
        var right: CGFloat = .zero
        switch position {
        case .left:
            right = 16
            // button.contentHorizontalAlignment = .right
        case .right:
            left = 16
            // button.contentHorizontalAlignment = .left
        case .leftTop:
            right = 16
            bottom = 24

        case .rightTop:
            left = 16
            bottom = 24
        }

        button.contentEdgeInsets = .init(
            top: .zero,
            left: left,
            bottom: bottom,
            right: right)
        return button
    }

    private func makeTitleLabel(_ title: TitleCustom) -> FeatLabel {
        let frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: 0.0,
            height: .greatestFiniteMagnitude)
        let label = FeatLabel()
        label.frame = frame
        label.style = .titleM
        label.text = title.title
        label.textAlignment = title.textAlignment ?? .left
        label.numberOfLines = 1
        if let color = title.color {
            label.textColor = color
        }
        return label
    }
}

fileprivate extension Array where Element == UIView {
    func toBarButtonItems() -> [UIBarButtonItem] {
        self.map { view in
            return .init(customView: view)
        }
    }
}
