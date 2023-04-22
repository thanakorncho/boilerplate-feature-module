//
//  Typography.swift

//
//  Created by KniGht ThanaKorn on 21/10/22.
//

import Foundation

struct Typography {
    enum TypeScale {
        case small
        case medium
        case large
    }

    enum TypoGraphy {
        case headline(TypeScale)
        case title(TypeScale)
        case body(TypeScale)
        case overline(TypeScale)
    }

    enum Weight {
        case bold
        case regular
        case italic
    }

    enum Size: CGFloat {
        /// Font Size: 10
        case mini = 10
        /// Font Size: 12
        case tiny = 12
        /// Font Size: 14
        case small = 14
        /// Font Size: 16
        case regular = 16
        /// Font Size: 18
        case medium = 18
        /// Font Size: 20
        case large = 20
        /// Font Size: 24
        case great = 24
        /// Font Size: 32
        case huge = 32
    }

    private(set) var typography: TypoGraphy

    init(typography: TypoGraphy) {
        self.typography = typography
    }

    // TODO: UNAVAILABLE IS NOW
    func token() -> UIFont {
        switch typography {
        case let .headline(scale):
            return headlineScale(scale)

        case let .title(scale):
            return titleScale(scale)

        case let .body(scale):
            return bodyScale(scale)

        case let .overline(scale):
            return overlineScale(scale)
        }
    }

    private func headlineScale(_ scale: TypeScale) -> UIFont {
        switch scale {
        case .small:
            return setFont(.regular, size: .large)

        case .medium:
            return setFont(.regular, size: .great)

        case .large:
            return setFont(.regular, size: .huge)
        }
    }

    private func titleScale(_ scale: TypeScale) -> UIFont {
        switch scale {
        case .small:
            return setFont(.regular, size: .medium)

        case .medium:
            return setFont(.regular, size: .large)

        case .large:
            return setFont(.regular, size: .great)
        }
    }

    private func bodyScale(_ scale: TypeScale) -> UIFont {
        switch scale {
        case .small:
            return setFont(.regular, size: .small)

        case .medium:
            return setFont(.regular, size: .regular)

        case .large:
            return setFont(.regular, size: .medium)
        }
    }

    private func overlineScale(_ scale: TypeScale) -> UIFont {
        switch scale {
        case .small:
            return setFont(.regular, size: .mini)

        case .medium:
            return setFont(.regular, size: .tiny)

        case .large:
            return setFont(.regular, size: .small)
        }
    }
}

extension Typography {
    private func setFont(_ weight: Weight, size: Size) -> UIFont {
        switch weight {
        case .bold:
            return .boldSystemFont(size)

        case .regular:
            return .systemFont(size)

        case .italic:
            return .italicSystemFont(size)
        }
    }
}

extension UIFont {
    class func systemFont(_ size: Typography.Size) -> UIFont {
        return .systemFont(ofSize: size.rawValue)
    }

    class func boldSystemFont(_ size: Typography.Size) -> UIFont {
        return .boldSystemFont(ofSize: size.rawValue)
    }

    class func italicSystemFont(_ size: Typography.Size) -> UIFont {
        return .italicSystemFont(ofSize: size.rawValue)
    }
}
