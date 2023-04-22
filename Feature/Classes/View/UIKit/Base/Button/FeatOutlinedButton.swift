//
//  FeatOutlinedButton.swift

//
//  Created by KniGht ThanaKorn on 14/3/22.
//

import UIKit

class FeatOutlinedButton: FeatButton {

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
            makeOutlined(borderColor: ThemeColor.primary)
            defaultBackgroundColor = ThemeColor.background
            backgroundColorForNormal = ThemeColor.background
            tintColorForSelected = ThemeColor.tint
            tintColorForNormal = ThemeColor.primary

        case .secondary:
//            gradient = .init(fromToColors: ThemeColor.background)
            makeOutlined(borderColor: ThemeColor.link)
            backgroundColorForDisabled = ThemeColor.disable
            borderColorForNormal = ThemeColor.link
            tintColorForNormal = ThemeColor.link
            borderColorForDisabled = ThemeColor.disable
            tintColorForDisabled = ThemeColor.disable
            isGradient = true

        default:
            break
        }
    }

    override func normalStateAction() {
        guard let style = style else {
            super.normalStateAction()
            return
        }

        switch style {
        case .main:
            isGradient = false

        case .secondary:
            isGradient = true

        default:
            break
        }

        super.normalStateAction()
    }

    override func selectedStateAction() {
        guard let style = style else {
            super.selectedStateAction()
            return
        }

        switch style {
        case .main:
            isGradient = true

        default:
            break
        }

        super.selectedStateAction()
    }

    override func disabledStateAction() {
        guard let style = style else {
            super.disabledStateAction()
            return
        }

        switch style {
        case .secondary:
            isGradient = false

        default:
            break
        }

        super.disabledStateAction()
    }
}
