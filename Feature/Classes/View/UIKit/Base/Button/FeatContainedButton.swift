//
//  FeatContainedButton.swift

//
//  Created by KniGht ThanaKorn on 14/3/22.
//

import UIKit

class FeatContainedButton: FeatButton {

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
            backgroundColorForDisabled = ThemeColor.disable
            defaultTextFont()
            makeContentEdgeInsets(
                top: 12,
                left: 16,
                bottom: 12,
                right: 16)
            isGradient = true

        case .secondary:
            makeFilled(backgroundColor: ThemeColor.background)
            defaultTextFont()

        case .plainPrimary:
            makeFilled(backgroundColor: ThemeColor.primary)
            defaultTextFont()

        case .tertiary:
//            gradient = .init(
//                fromToColors: ThemeColor.background,
//                locations: nil,
//                direction: .topToBottom)
            backgroundColorForDisabled = ThemeColor.disable
            defaultTextFont()
            titleColorForNormal = ThemeColor.text
            tintColor = ThemeColor.tint
            makeContentEdgeInsets(
                top: 12,
                left: 16,
                bottom: 12,
                right: 16)
            isGradient = true

        default:
            break
        }
    }
}

// MARK: - Helper
extension FeatContainedButton {
    private func defaultTextFont() {
        textFont = .boldSystemFont(ofSize: 14)
        titleLabel?.textAlignment = .center
    }
}
