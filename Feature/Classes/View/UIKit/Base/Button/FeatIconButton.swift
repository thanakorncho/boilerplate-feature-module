//
//  FeatIconButton.swift

//
//  Created by KniGht ThanaKorn on 21/10/22.
//

import Foundation

class FeatIconButton: FeatButton {

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

        makeTransparent()
        switch style {
        case .main:
            tintColor = ThemeColor.primary

        case .secondary:
            tintColor = ThemeColor.tint

        case .tertiary:
            tintColor = ThemeColor.link

        case .plainPrimary:
            tintColor = ThemeColor.outlineVariant

        case .quaternary:
            tintColor = ThemeColor.primary
        }
    }
}
