//
//  CommonView.swift

//
//  Created by KniGht ThanaKorn on 18/10/22.
//

import Foundation

public struct CommonView {
    struct Style {
        enum Label {
            case style(FeatLabel.Style)
            case alignment(NSTextAlignment)
            case backgroundColor(UIColor)
            case textColor(UIColor)
            case font(UIFont)
            case lines(Int)
            case insets(UIEdgeInsets)
        }

        enum View {
            case backgroundColor(UIColor)
        }

        enum Button {
            case alignment(NSTextAlignment)
            case backgroundColor(UIColor)
            case tintColor(UIColor)
            case font(UIFont)
            case contentInsets(UIEdgeInsets)
            case imageInsets(UIEdgeInsets)
        }
    }

    struct Shadow {
        var ofColor: UIColor?
        var radius: CGFloat?
        var offset: CGSize?
        var opacity: Float?
    }

    struct RoundedCorner {
        var corners: [UIView.CornerMask]?
        var cornerRadius: CGFloat?
        var isBorder: Bool = false
    }

    struct Border {
        var width: CGFloat = 1.0
        var color: UIColor
    }

    public struct Gradient {
        let fromToColors: [UIColor]
        var locations: [CGFloat]?
        var direction: GradientDirection = .topToBottom
        var cornerRadius: CGFloat?
        var maskedCorners: [UIView.CornerMask]?
    }
}

// MARK: - Switch
extension CommonView {
    public struct Switch {
        public enum State {
            case on
            case off
            case all
        }

        public struct Control {
            public var backgroundColor: [State: UIColor]

            public init(backgroundColor: [State : UIColor]) {
                self.backgroundColor = backgroundColor
            }
        }

        public struct Label {
            public var fonts: [State: UIFont]
            public var textColors: [State: UIColor]
            public var textAlignments: [State: NSTextAlignment]

            public init(fonts: [State : UIFont], textColors: [State : UIColor], textAlignments: [State : NSTextAlignment]) {
                self.fonts = fonts
                self.textColors = textColors
                self.textAlignments = textAlignments
            }
        }

        public struct Thumb {
            public var backgroundColor: [State: UIColor]
            public var tintColor: [State: UIColor]
            public var cornerRadius: CGFloat?

            public init(backgroundColor: [State : UIColor], tintColor: [State : UIColor], cornerRadius: CGFloat? = nil) {
                self.backgroundColor = backgroundColor
                self.tintColor = tintColor
                self.cornerRadius = cornerRadius
            }
        }
    }
}
