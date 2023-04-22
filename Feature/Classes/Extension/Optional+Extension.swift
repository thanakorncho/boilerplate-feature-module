//
//  Optional+Extension.swift

//
//  Created by KniGht ThanaKorn on 14/6/22.
//

import Foundation

extension Optional where Wrapped == Int {
    /// SwifterSwift: Check if optional is nil or empty int.
    var isEmpty: Bool {
        return self == nil
    }
}

extension Optional where Wrapped == Date {
    /// SwifterSwift: Check if optional is nil or empty date.
    var isEmpty: Bool {
        return self == nil
    }
}

extension Optional where Wrapped == CGFloat {
    /// SwifterSwift: Check if optional is nil or empty CGFloat.
    var isEmpty: Bool {
        return self == nil
    }
}

extension Optional where Wrapped == UIColor {
    /// SwifterSwift: Check if optional is nil or empty UIColor.
    var isEmpty: Bool {
        return self == nil
    }
}

extension Optional where Wrapped == UIImage {
    /// SwifterSwift: Check if optional is nil or empty UIImage.
    var isEmpty: Bool {
        return self == nil
    }
}
