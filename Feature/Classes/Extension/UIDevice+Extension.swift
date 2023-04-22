//
//  UIDevice+Extension.swift

//
//  Created by Chareef Whungpakdee on 6/5/2565 BE.
//

import UIKit

extension UIDevice {

    // Portrait Size
    class func screenSize() -> CGSize {
        struct Static {
            static var onceToken: Int = 0
            static var size: CGSize = CGSize.zero
        }

        let size = UIScreen.main.bounds.size
        let width = size.width
        let height = size.height
        Static.size = CGSize(width: width, height: height)

        return Static.size
    }

    class func screenWidth() -> CGFloat {
        return UIDevice.screenSize().width
    }

    class func screenHeight() -> CGFloat {
        return UIDevice.screenSize().height
    }

    class func isLandscape() -> Bool {
        return UIApplication.shared.statusBarOrientation.isLandscape
    }

    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }

   class func safeAreaInsetsBottom() -> CGFloat {
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.keyWindow {
                return window.safeAreaInsets.bottom
            }
        }
        return 0
    }

   class func safeAreaInsetsTop() -> CGFloat {
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.keyWindow {
                return window.safeAreaInsets.top
            }
        }
        return 20
    }
}
