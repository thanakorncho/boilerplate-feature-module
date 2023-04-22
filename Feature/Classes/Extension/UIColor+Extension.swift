//
//  UIColor+Extension.swift

//
//  Created by KniGht ThanaKorn on 19/10/22.
//

import Foundation

public extension UIColor {
    static func gradient(
        _ gradient: CommonView.Gradient,
        frame: CGRect
    ) -> UIColor? {
        return UIColor.gradient(
            direction: gradient.direction,
            frame: frame,
            colors: gradient.fromToColors,
            cornerRadius: gradient.cornerRadius,
            locations: gradient.locations)
    }

    static func gradient(
        gradient: inout GradientLayer,
        frame: CGRect
    ) -> UIColor? {
        guard
            let image = UIImage.gradient(
                gradient: &gradient,
                frame: frame)
        else {
            return nil
        }

        return .init(patternImage: image)
    }

    public static func gradient(
        direction: GradientDirection,
        frame: CGRect,
        colors: [UIColor],
        cornerRadius: CGFloat? = nil,
        locations: [CGFloat]? = nil
    ) -> UIColor? {
        var gradient = GradientLayer(
            direction: direction,
            colors: colors,
            cornerRadius: cornerRadius,
            locations: locations)
        return UIColor.gradient(gradient: &gradient, frame: frame)
    }
}
