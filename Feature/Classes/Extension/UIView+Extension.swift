//
//  UIView+Extension.swift

//
//  Created by KniGht ThanaKorn on 14/3/22.
//

import UIKit

extension UIView {
    var windowSafeAreaInsets: UIEdgeInsets? {
        UIApplication.shared.keyWindow?.safeAreaInsets
    }

    public var safeAreaFrame: CGRect {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.layoutFrame
        }
        return bounds
    }
}

extension UIView {

    @discardableResult
    func instanceFromNib() -> UIView? {
        let named = String(describing: type(of: self))
        guard let contentView = loadViewFromNib() else {
            fatalError("First element in xib file \(named) is not of type \(named)")
        }
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return contentView
    }

    func loadViewFromNib() -> UIView? {
        let named = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = bundle.loadNibNamed(named, owner: self, options: nil)
        return nib?.first as? UIView
    }

    func withRoundedCorners(radius: CGFloat? = nil) {
        let maxRadius = min(size.width, size.height) / 2
        if let radius = radius, radius > 0 && radius <= maxRadius {
            layer.cornerRadius = radius
        } else {
            layer.cornerRadius = maxRadius
        }
        layer.masksToBounds = true
    }

    /// layerMaxXMaxYCorner - bottom right corner
    /// layerMaxXMinYCorner - top right corner
    /// layerMinXMaxYCorner - bottom left corner
    /// layerMinXMinYCorner - top left corner
    /// - Parameters:
    ///   - maskedCorners: array of corners to change (example: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]).
    ///   - radius: radius for selected corners.
    func roundCorners(
        _ maskedCorners: CACornerMask? = nil,
        cornerRadius: CGFloat? = nil
    ) {
        let allCorners: CACornerMask = [
            .layerMaxXMinYCorner,
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner,
            .layerMinXMinYCorner
        ]
        let maxRadius = min(size.width, size.height) / 2
        let maskedCorners = maskedCorners ?? allCorners
        let cornerRadius = cornerRadius ?? maxRadius
        layer.maskedCorners = maskedCorners
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
    }

    func roundCorners(
        _ corners: UIRectCorner,
        radius: CGFloat? = nil,
        isBorder: Bool = false
    ) {
        let maxRadius = min(size.width, size.height) / 2
        let radius = radius ?? maxRadius
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))

        let shape = CAShapeLayer()
        if borderWidth.isPositive {
            shape.lineWidth = borderWidth
        }
        shape.path = maskPath.cgPath
        shape.frame = bounds
        layer.mask = shape

        if isBorder {
            layerBorder(maskPath)
        }
    }

    func layerBorder(_ maskPath: UIBezierPath, color: UIColor? = nil) {
        guard borderWidth.isPositive else {
            return
        }

        let frameLayer = CAShapeLayer()
        frameLayer.frame = bounds
        frameLayer.path = maskPath.cgPath
        if let color = color {
            frameLayer.strokeColor = color.cgColor
        } else if let color = borderColor {
            frameLayer.strokeColor = color.cgColor
        }
        frameLayer.fillColor = nil
        frameLayer.lineWidth = borderWidth * 2
        layer.addSublayer(frameLayer)

        if borderWidth.isPositive, borderColor.isEmpty.not {
            removeBorder()
        }
    }

    func removeBorder() {
        borderWidth = 0
        borderColor = nil
    }

    func removeRoundedCorners() {
        layer.mask = nil
        layer.cornerRadius = 0
        layer.maskedCorners = .init()
    }

    func shadowRasterize() {
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: cornerRadius).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }

    func removeShadow() {
        layer.shadowColor = nil
        layer.shadowOpacity = 0.0
        layer.shadowPath = nil
        layer.shouldRasterize = false
    }
}

// MARK: - Gradient
extension UIView {
    func removeGradient() {
        self.layer.sublayers?.forEach {
            if $0.isKind(of: CAGradientLayer.self) {
                $0.removeFromSuperlayer()
                return
            }
        }
    }

    func gradient(_ gradient: CommonView.Gradient) {
        removeGradient()
        self.gradient(
            direction: gradient.direction,
            colors: gradient.fromToColors,
            cornerRadius: gradient.cornerRadius,
            locations: gradient.locations,
            maskedCorners: gradient.maskedCorners)
    }

    func gradientBorder(
        _ gradient: CommonView.Gradient,
        border: CommonView.Border
    ) {
        removeGradient()
        removeBorder()
        self.gradientBorder(
            direction: gradient.direction,
            colors: gradient.fromToColors,
            cornerRadius: gradient.cornerRadius,
            locations: gradient.locations,
            maskedCorners: gradient.maskedCorners,
            borderWidth: border.width,
            borderColor: border.color)
    }

    func gradient(
        direction: GradientDirection,
        colors: [UIColor],
        cornerRadius: CGFloat? = nil,
        type: CAGradientLayerType = .axial,
        locations: [CGFloat]? = nil,
        maskedCorners: [UIView.CornerMask]? = nil
    ) {
        let gradient = GradientLayer(
            direction: direction,
            colors: colors,
            cornerRadius: cornerRadius,
            type: type,
            locations: locations)
        gradient.frame = self.bounds
        if cornerRadius.isEmpty, self.cornerRadius.isPositive {
            gradient.cornerRadius = self.cornerRadius
        }
        self.layer.insertSublayer(gradient, at: 0)
    }

    func gradientBorder(
        direction: GradientDirection,
        colors: [UIColor],
        cornerRadius: CGFloat? = nil,
        type: CAGradientLayerType = .axial,
        locations: [CGFloat]? = nil,
        maskedCorners: [UIView.CornerMask]? = nil,
        borderWidth: CGFloat,
        borderColor: UIColor
    ) {
        let shape = CAShapeLayer()
        let gradient = GradientLayer(
            direction: direction,
            colors: colors,
            cornerRadius: cornerRadius,
            type: type,
            locations: locations)
        let maxRadius = min(size.width, size.height) / 2
        let radius = cornerRadius ?? self.cornerRadius
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: maskedCorners?.rectCorner ?? .allCorners,
            cornerRadii: .init(width: radius, height: radius))
        gradient.frame = self.bounds
        shape.lineWidth = borderWidth * 2
        shape.path = path.cgPath
        shape.strokeColor = borderColor.cgColor
        shape.fillColor = nil
        gradient.mask = shape
        layer.addSublayer(gradient)
    }
}

extension UIView {
    static func corners(_ masks: [UIView.CornerMask]?) -> CACornerMask? {
        guard let corners = masks else { return nil }

        return corners.cornerMask
    }
}

// MARK: - Model
extension UIView {
    enum CornerMask {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight

        var asCACornerMask: CACornerMask {
            switch self {
            case .topLeft:
                return .layerMinXMinYCorner

            case .topRight:
                return .layerMaxXMinYCorner

            case .bottomLeft:
                return .layerMinXMaxYCorner

            case .bottomRight:
                return .layerMaxXMaxYCorner
            }
        }
    }
}

extension Array where Element == UIView.CornerMask {
    var rectCorner: UIRectCorner {
        return self.compactMap { corner in
            switch corner {
            case .topLeft:
                return .topLeft

            case .topRight:
                return .topRight

            case .bottomLeft:
                return .bottomLeft

            case .bottomRight:
                return .bottomRight
            }
        }.reduce(UIRectCorner(), { result, corner in
            return result.union(corner)
        })
    }

    var cornerMask: CACornerMask {
        return self.compactMap { corner in
            return corner.asCACornerMask
        }.reduce(CACornerMask(), { result, corner in
            return result.union(corner)
        })
    }
}
