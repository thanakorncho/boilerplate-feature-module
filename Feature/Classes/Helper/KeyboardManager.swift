//
//  KeyboardManager.swift

//
//  Created by Thanakorn Chongcharoenthanakul on 29/3/2566 BE.
//

import Foundation
import IQKeyboardManagerSwift

public class KeyboardManager {

    private typealias Keyboard = IQKeyboardManager
    private static var keyboard = Keyboard.shared

    public static func addGestureIgnoreView(types: UIView.Type...) {
        types.forEach { type in
            guard !keyboard.touchResignedGestureIgnoreClasses.contains(where: { $0 == type }) else {
                print("exist touch outside ignore class: \(String(describing: type))")
                return
            }

            keyboard.touchResignedGestureIgnoreClasses.append(type)
        }
    }

    public static func removeGestureIgnoreView(types: UIView.Type...) {
        types.forEach { type in
            keyboard.touchResignedGestureIgnoreClasses.removeFirst(where: { $0 == type })
        }
    }

    @discardableResult
    static func checkResignOnTouchOutside() -> Bool {
        guard keyboard.shouldResignOnTouchOutside else {
            print("keyboard resign touch out side disabled")
            return false
        }

        return true
    }
}
