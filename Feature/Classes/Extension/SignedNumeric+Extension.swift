//
//  SignedNumeric+Extension.swift

//
//  Created by KniGht ThanaKorn on 23/3/22.
//

import Foundation

extension SignedNumeric {
    var decimalCommas: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let number = self as? NSNumber {
            return formatter.string(from: number)
        } else {
            return nil
        }
    }

    var localeCurrencyNoSymbol: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0
        formatter.minimumFractionDigits = 0
        formatter.currencySymbol = ""
        // swiftlint:disable:next force_cast
        return formatter.string(from: self as! NSNumber)
    }
}
