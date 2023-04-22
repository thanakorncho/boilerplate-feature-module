//
//  FeatTextButton.swift

//
//  Created by KniGht ThanaKorn on 14/3/22.
//

import UIKit

class FeatTextButton: FeatButton {

    override var style: Style? {
        didSet {
            setupStyle()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
    }

    override func setupStyle() {
        guard let style = style else {
            return
        }

        switch style {
        case .main:
//            gradient = .init(
//                fromToColors: ThemeColor.buttonPrimary,
//                locations: [0, 0.53, 1.0],
//                direction: .topRightToBottomLeft)
            titleColorForNormal = ThemeColor.text
            titleColorForDisabled = ThemeColor.text
            backgroundColorForDisabled = ThemeColor.disable
            isGradient = true
            makeContentEdgeInsets(
                top: .spacer([.s8, .s4]),
                left: .spacer(.s32),
                bottom: .spacer([.s8, .s4]),
                right: .spacer(.s32))

        case .secondary:
//            titleColorForNormal = UIColor.gradient(
//                .init(fromToColors: ThemeColor.background,
//                      direction: .topToBottom),
//                frame: bounds)
            titleColorForSelected = ThemeColor.text
            backgroundColorForNormal = ThemeColor.link
            backgroundColorForSelected = ThemeColor.disable

        case .plainPrimary:
            titleColorForNormal = ThemeColor.primary
            tintColorForNormal = ThemeColor.primary

        case .tertiary:
//            let gradientColor = UIColor.gradient(
//                .init(fromToColors: ThemeColor.background,
//                      direction: .topToBottom),
//                frame: frame)
            makeFilled(backgroundColor: ThemeColor.link)
//            tintColorForNormal = gradientColor
            titleColorForNormal = ThemeColor.text

        case .quaternary:
//            gradient = .init(
//                fromToColors: ThemeColor.buttonPrimary,
//                locations: [0, 0.53, 1.0],
//                direction: .topRightToBottomLeft)
            titleColorForNormal = ThemeColor.text
            titleColorForDisabled = ThemeColor.disable
            backgroundColorForDisabled = ThemeColor.disable
            isGradient = true
        }
    }

    override func normalStateAction() {
        guard let style = style else {
            super.normalStateAction()
            return
        }

        switch style {
        case .main, .quaternary:
            isGradient = true

        default:
            break
        }

        super.normalStateAction()
    }

    override func disabledStateAction() {
        guard let style = style else {
            super.disabledStateAction()
            return
        }

        switch style {
        case .main, .quaternary:
            isGradient = false

        default:
            break
        }

        super.disabledStateAction()
    }
}
