//
//  String+Extension.swift

//
//  Created by KniGht ThanaKorn on 15/6/22.
//

import Foundation

extension String {
    var digits: String {
        self.components(separatedBy: .decimalDigits.inverted).joined()
    }

    var plusSign: Self? {
        if let plusSign = NumberFormatter().plusSign {
            return "\(self)\(plusSign)"
        } else {
            return nil
        }
    }
}

extension String.SubSequence {
    var string: String {
        return String(self)
    }
}
