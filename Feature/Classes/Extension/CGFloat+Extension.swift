//
//  CGFloat+Extension.swift

//
//  Created by KniGht ThanaKorn on 23/10/22.
//

import Foundation

extension CGFloat {
    mutating func negitive() -> Self {
        switch self.sign {
        case .plus:
            self.negate()
            return self

        case .minus:
            return self
        }
    }

    mutating func positive() -> Self {
        switch self.sign {
        case .plus:
            return self

        case .minus:
            self.negate()
            return self
        }
    }
}
