//
//  CommonViewController.swift

//
//  Created by Thanakorn Chongcharoenthanakul on 11/1/2566 BE.
//

import Foundation
import UIKit

struct CommonViewController {

    /// Curve of animation
    ///
    /// - linear: linear
    /// - easeIn: ease in
    /// - easeOut: ease out
    /// - easeInOut: ease in - ease out
    enum Curve {
        case linear
        case easeIn
        case easeOut
        case easeInOut

        /// Return the media timing function associated with curve
        internal var function: CAMediaTimingFunction {
            let key: String!
            switch self {
            case .linear:
                key = convertFromCAMediaTimingFunctionName(CAMediaTimingFunctionName.linear)

            case .easeIn:
                key = convertFromCAMediaTimingFunctionName(CAMediaTimingFunctionName.easeIn)

            case .easeOut:
                key = convertFromCAMediaTimingFunctionName(CAMediaTimingFunctionName.easeOut)

            case .easeInOut:
                key = convertFromCAMediaTimingFunctionName(CAMediaTimingFunctionName.easeInEaseOut)
            }
            return CAMediaTimingFunction(name: convertToCAMediaTimingFunctionName(key))
        }
    }

    /// Direction of the animation
    ///
    /// - fade: fade to new controller
    /// - toTop: slide from bottom to top
    /// - toBottom: slide from top to bottom
    /// - toLeft: pop to left
    /// - toRight: push to right
    public enum Direction {
        case fade
        case toTop
        case toBottom
        case toLeft
        case toRight

        /// Return the associated transition
        ///
        /// - Returns: transition
        internal func transition() -> CATransition {
            let transition = CATransition()
            transition.type = CATransitionType.push
            switch self {
            case .fade:
                transition.type = CATransitionType.fade
                transition.subtype = nil

            case .toLeft:
                transition.subtype = CATransitionSubtype.fromLeft

            case .toRight:
                transition.subtype = CATransitionSubtype.fromRight

            case .toTop:
                transition.subtype = CATransitionSubtype.fromTop

            case .toBottom:
                transition.subtype = CATransitionSubtype.fromBottom
            }
            return transition
        }
    }

    struct TransitionOptions {
        let direction: Direction
        let curve: Curve
        let duration: CFTimeInterval
    }
}

// Helper function inserted by Swift 4.2 migrator.
private func convertFromCAMediaTimingFunctionName(_ input: CAMediaTimingFunctionName) -> String {
    return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
private func convertToCAMediaTimingFunctionName(_ input: String) -> CAMediaTimingFunctionName {
    return CAMediaTimingFunctionName(rawValue: input)
}
