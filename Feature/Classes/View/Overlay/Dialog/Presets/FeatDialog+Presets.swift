//
//  FeatDialog+Presets.swift
//  AcknowList
//
//  Created by KniGht ThanaKorn on 12/7/22.
//

import Foundation
import SwiftEntryKit

public extension EKAttributes {
    static var fullFloat: EKAttributes {
        var attributes = EKAttributes.centerFloat
        let translate = EKAttributes.Animation.Translate(
            duration: 0.7,
            spring: .init(damping: 0.7, initialVelocity: 0))
        let scale = EKAttributes.Animation.RangeAnimation(
            from: 0.7,
            to: 1,
            duration: 0.4,
            spring: .init(damping: 1, initialVelocity: 0))
        attributes.hapticFeedbackType = .success
        attributes.displayDuration = .infinity
        attributes.screenBackground = .color(color: .standardBackground)
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.entranceAnimation = .init(
            translate: translate,
            scale: scale)
        //        attributes.statusBar = .dark
        attributes.scroll = .disabled
        attributes.positionConstraints.size = .init(
            width: .offset(value: 24),
            height: .ratio(value: 0.8))
        attributes.positionConstraints.maxSize = .init(
            width: .offset(value: 24),
            height: .offset(value: 96))
        return attributes
    }

    static var loading: EKAttributes {
        var attributes = EKAttributes.centerFloat
        attributes.displayMode = .inferred
        attributes.windowLevel = .alerts
        attributes.displayDuration = .infinity
        attributes.hapticFeedbackType = .success
        attributes.screenInteraction = .absorbTouches
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .disabled
        attributes.screenBackground = .color(color: .white)
        attributes.entryBackground = .color(color: .white)
        attributes.entranceAnimation = .init(
            scale: .init(
                from: 0.9,
                to: 1,
                duration: 0.2,
                spring: .init(damping: 1, initialVelocity: 0)
            ),
            fade: .init(
                from: 0,
                to: 1,
                duration: 0.1
            )
        )
        attributes.exitAnimation = .init(
            fade: .init(
                from: 1,
                to: 0,
                duration: 0.1
            )
        )
        attributes.popBehavior = .overridden
//        attributes.shadow = .active(
//            with: .init(
//                color: .black,
//                opacity: 0.2,
//                radius: 3
//            )
//        )
        attributes.roundCorners = .all(radius: 24)
        attributes.positionConstraints.maxSize = .init(
            width: .ratio(value: 0.65),
            height: .intrinsic
        )
        return attributes
    }

    static var simpleTopFloat: EKAttributes {
        var attributes = EKAttributes.topFloat
        attributes.entryBackground = .color(color: .init(ThemeColor.background))
        attributes.hapticFeedbackType = .success
        attributes.entryInteraction = .absorbTouches
        attributes.popBehavior = .animated(
            animation: .init(
                translate: .init(duration: 0.3),
                scale: .init(from: 1, to: 0.7, duration: 0.7)
            )
        )
        attributes.shadow = .active(
            with: .init(
                color: .black,
                opacity: 0.5,
                radius: 10,
                offset: .zero)
        )
        attributes.statusBar = .dark
        attributes.scroll = .enabled(
            swipeable: true,
            pullbackAnimation: .easeOut)
        attributes.positionConstraints.maxSize = .init(
            width: .constant(value: UIScreen.main.minEdge),
            height: .intrinsic)
        return attributes
    }

    static var centerFloatDialog: EKAttributes {
        let backgroundColor = ThemeColor.background.withAlphaComponent(0.2)
        var attributes = EKAttributes.centerFloat
        attributes.displayDuration = .infinity
        attributes.hapticFeedbackType = .success
        attributes.scroll = .disabled
        attributes.screenInteraction = .absorbTouches
        attributes.shadow = .none
        attributes.positionConstraints.size = .init(
            width: .ratio(value: 0.5),
            height: .ratio(value: 0.3))
        attributes.positionConstraints.maxSize = .init(
            width: .ratio(value: 0.7),
            height: .ratio(value: 0.5))
        attributes.screenBackground = .color(color: .init(backgroundColor))
        attributes.entranceAnimation = .init(
            scale: .init(
                from: 0.9,
                to: 1,
                duration: 0.4,
                spring: .init(damping: 1, initialVelocity: 0)
            ),
            fade: .init(
                from: 0,
                to: 1,
                duration: 0.3
            )
        )
        attributes.exitAnimation = .init(
            fade: .init(
                from: 1,
                to: 0,
                duration: 0.2
            )
        )
        attributes.shadow = .active(
            with: .init(
                color: .black,
                opacity: 0.3,
                radius: 5
            )
        )
        return attributes
    }

    static var fullScreen: EKAttributes {
        let backgroundColor = ThemeColor.background.withAlphaComponent(0.3)
        var attributes: EKAttributes = .toast
        attributes.displayMode = .inferred
        attributes.windowLevel = .normal
        attributes.position = .bottom
        attributes.displayDuration = .infinity
        attributes.entranceAnimation = .init(
            translate: .init(
                duration: 0.65,
                spring: .init(damping: 1, initialVelocity: 0)
            )
        )
        attributes.exitAnimation = .init(
            translate: .init(
                duration: 0.65,
                spring: .init(damping: 1, initialVelocity: 0)
            )
        )
        attributes.popBehavior = .animated(
            animation: .init(
                translate: .init(
                    duration: 0.65,
                    spring: .init(damping: 1, initialVelocity: 0)
                )
            )
        )
        attributes.entryInteraction = .absorbTouches
        attributes.screenInteraction = .dismiss
        attributes.shadow = .none
        attributes.screenBackground = .color(color: .init(backgroundColor))
        attributes.scroll = .disabled
        attributes.positionConstraints = .fullScreen
        attributes.positionConstraints.safeArea = .overridden
        return attributes
    }
}
