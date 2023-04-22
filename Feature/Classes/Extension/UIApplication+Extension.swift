//
//  UIApplication+Extension.swift

//
//  Created by Thanakorn Chongcharoenthanakul on 30/9/2565 BE.
//

import Foundation

extension UIApplication {
    static var topViewController: UIViewController? {
        let window = currentlyWindow
        if #available(iOS 13.0, *) {
            let navigation = window?.rootViewController as? UINavigationController
            return navigation?.topViewController
        } else {
            let navigation = window?.rootViewController as? UINavigationController
            return  navigation?.topViewController
        }
    }

    static var currentlyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .compactMap { $0 as? UIWindowScene }
                .first?.windows
                .first(where: { $0.isKeyWindow })
        } else {
            return UIApplication.shared.keyWindow
        }
    }

    static var orientation: UIInterfaceOrientation {
        if #available(iOS 13.0, *) {
            let windowScene = currentlyWindow?.windowScene
            return windowScene?.interfaceOrientation ?? .unknown
        } else {
            return shared.statusBarOrientation
        }
    }
}
