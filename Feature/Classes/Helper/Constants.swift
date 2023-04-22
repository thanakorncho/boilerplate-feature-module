//
//  Constants.swift

//
//  Created by Thanakorn Chongcharoenthanakul on 5/10/2565 BE.
//

import Foundation
import SnapKit

struct Constants {
    static func spacer(_ spacer: Spacer...) -> CGFloat {
        return spacer.sum(for: \.rawValue)
    }

    static func spacer(_ spacer: [Spacer]) -> CGFloat {
        return spacer.sum(for: \.rawValue)
    }

    enum Axis {
        case horizontal
        case vertical
    }

    enum SignedValue {
        case negative
        case positive
    }

    enum ImageRatio: CGFloat {
        /// Aspect Ratio: 1:1
        case square
        /// Aspect Ratio: 4.3
        case fullFrame
        /// Aspect Ratio: 5:4
        case computerDisplay
        /// Aspect Ratio: 16:9
        case wideScreen
        /// Aspect Ratio: 21:9
        case cinemaScope

        var rawValue: CGFloat {
            switch self {
            case .square:
                return 1.0 / 1.0

            case .fullFrame:
                return 4.0 / 3.0

            case .computerDisplay:
                return 5.0 / 4.0

            case .wideScreen:
                return 16.0 / 9.0

            case .cinemaScope:
                return 21.0 / 9.0
            }
        }
    }

    enum Spacer: CGFloat {
        case zero = 0
        case s2 = 2
        case s4 = 4
        case s8 = 8
        case s16 = 16
        case s24 = 24
        case s32 = 32
        case s48 = 48
        case s64 = 64
        case s80 = 80
        case s96 = 96
        case s120 = 120
    }
}

extension CGFloat {
    static func spacer(_ space: Constants.Spacer, negative: Bool = false) -> CGFloat {
        var spacer = Constants.spacer(space)
        if negative {
            return spacer.negitive()
        } else {
            return spacer
        }
    }

    static func spacer(_ spaces: [Constants.Spacer], negative: Bool = false) -> CGFloat {
        var spacer = Constants.spacer(spaces)
        if negative {
            return spacer.negitive()
        } else {
            return spacer
        }
    }
}

extension ConstraintMakerRelatable {
    @discardableResult
    func equalTo(_ other: Constants.Spacer) -> ConstraintMakerEditable {
        return self.equalTo(other.rawValue)
    }

    @discardableResult
    func equalTo(_ other: Constants.Spacer...) -> ConstraintMakerEditable {
        return self.equalTo(other.sum(for: \.rawValue))
    }

    @discardableResult
    func lessThanOrEqualTo(_ other: Constants.Spacer) -> ConstraintMakerEditable {
        return self.lessThanOrEqualTo(other.rawValue)
    }

    @discardableResult
    func greaterThanOrEqualTo(_ other: Constants.Spacer) -> ConstraintMakerEditable {
        return self.greaterThanOrEqualTo(other.rawValue)
    }
}

internal extension ConstraintMakerEditable {
    @discardableResult
    func multipliedBy(
        _ amount: Constants.ImageRatio
    ) -> ConstraintMakerEditable {
        self.multipliedBy(amount.rawValue)
        return self
    }

    @discardableResult
    func offset(
        _ amount: Constants.Spacer,
        _ signed: Constants.SignedValue = .positive
    ) -> ConstraintMakerEditable {
        let value = signedValue(
            amount: amount.rawValue,
            signed: signed)
            offset(value)
            return self
        }

    @discardableResult
    func inset(
        _ amount: Constants.Spacer,
        _ signed: Constants.SignedValue = .positive
    ) -> ConstraintMakerEditable {
        let value = signedValue(
            amount: amount.rawValue,
            signed: signed)
        self.inset(value)
        return self
    }

    @discardableResult
    func offset(
        _ amount: [Constants.Spacer],
        _ signed: Constants.SignedValue = .positive
    ) -> ConstraintMakerEditable {
        let value = signedValue(
            amount: amount.sum(for: \.rawValue),
            signed: signed)
        self.offset(value)
        return self
    }

    @discardableResult
    func inset(
        _ amount: [Constants.Spacer],
        _ signed: Constants.SignedValue = .positive
    ) -> ConstraintMakerEditable {
        let value = signedValue(
            amount: amount.sum(for: \.rawValue),
            signed: signed)
        self.inset(value)
        return self
    }

    private func signedValue(
        amount: CGFloat,
        signed: Constants.SignedValue
    ) -> CGFloat {
        switch signed {
        case .negative:
            var amount = amount
            return amount.negitive()

        case .positive:
            var amount = amount
            return amount.positive()
        }
    }
}

extension Constraint {
    @discardableResult
    func update(offset: Constants.Spacer...) -> Constraint {
        return self.update(offset: Constants.spacer(offset))
    }

    @discardableResult
    func update(inset: Constants.Spacer...) -> Constraint {
        return self.update(inset: Constants.spacer(inset))
    }
}
