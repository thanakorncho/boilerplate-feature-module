//
//  ConstraintViewDSL+Extensino.swift

//
//  Created by KniGht ThanaKorn on 28/10/22.
//

import Foundation
import SnapKit

extension ConstraintViewDSL {
    func huggingPriority(_ axis: Constants.Axis, value: Float) {
        switch axis {
        case .horizontal:
            self.contentHuggingHorizontalPriority = value

        case .vertical:
            self.contentHuggingVerticalPriority = value
        }
    }

    func huggingPriority(_ axis: Constants.Axis, increment: Float) {
        switch axis {
        case .horizontal:
            self.contentHuggingHorizontalPriority += increment

        case .vertical:
            self.contentHuggingVerticalPriority += increment
        }
    }

    func compressionResistancePriority(_ axis: Constants.Axis, value: Float) {
        switch axis {
        case .horizontal:
            self.contentCompressionResistanceHorizontalPriority = value

        case .vertical:
            self.contentCompressionResistanceVerticalPriority = value
        }
    }

    func compressionResistancePriority(_ axis: Constants.Axis, increment: Float) {
        switch axis {
        case .horizontal:
            self.contentCompressionResistanceHorizontalPriority += increment

        case .vertical:
            self.contentCompressionResistanceVerticalPriority += increment
        }
    }
}
