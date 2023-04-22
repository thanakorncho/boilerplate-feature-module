//
//  FeatDialog+Property.swift
//
//  Created by Thanakorn Chongcharoenthanakul on 27/9/2565 BE.
//

import Foundation
import SwiftEntryKit

extension EKProperty {
    enum `Type` {
        case title
        case description
    }

    static func simpleLabelContent(
        type: `Type`,
        text: String? = nil,
        color: EKColor? = nil
    ) -> LabelContent {
        let defaultColor = ThemeColor.text
        let defaultFont = UIFont.boldSystemFont(ofSize: 14)

        switch type {
        case .title:
            let style = LabelStyle(
                font: defaultFont,
                color: .init(defaultColor))
            return .init(text: "", style: style)

        case .description:
            let style = LabelStyle(
                font: defaultFont,
                color: color ?? .init(defaultColor),
                alignment: .center)
            return .init(text: text ?? "", style: style)
        }
    }
}
