//
//  EKAttributes+Extension.swift

//
//  Created by KniGht ThanaKorn on 18/10/22.
//

import Foundation
import SwiftEntryKit

extension EKAttributes {
    @discardableResult
    mutating func update(
        precedence: Precedence? = nil,
        displayDuration: DisplayDuration? = nil
    ) -> Self {
        if let precedence = precedence {
            self.precedence = precedence
        }
        if let displayDuration = displayDuration {
            self.displayDuration = displayDuration
        }
        return self
    }
}
