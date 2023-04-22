//
//  GradientLayer.swift

//
//  Created by KniGht ThanaKorn on 19/10/22.
//

import Foundation

open class GradientLayer: CAGradientLayer {

    // MARK: - Constants
    private var direction: GradientDirection = .leftToRight

    // MARK: - Life Cycle
    init(
        direction: GradientDirection,
        colors: [UIColor],
        cornerRadius: CGFloat? = nil,
        type: CAGradientLayerType = .axial,
        locations: [CGFloat]? = nil
    ) {
        super.init()
        setup(direction: direction,
              colors: colors,
              cornerRadius: cornerRadius,
              type: type,
              locations: locations)
    }

    public override init(layer: Any) {
        super.init(layer: layer)
    }

    required public init?(coder: NSCoder) {
        super.init()
    }

    private func setup(
        direction: GradientDirection,
        colors: [UIColor],
        cornerRadius: CGFloat?,
        type: CAGradientLayerType,
        locations: [CGFloat]?
    ) {
        let (startPoint, endPoint) = getStartAndEndPointsOf(direction)
        self.direction = direction
        self.needsDisplayOnBoundsChange = true
        self.colors = colors.map { $0.cgColor }
        self.locations = locations?.map { NSNumber(value: Double($0)) }
        if let cornerRadius = cornerRadius {
            self.cornerRadius = cornerRadius
        }
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.type = type
    }

    public final func clone() -> GradientLayer {
        return GradientLayer(
            direction: direction,
            colors: castToColors(),
            cornerRadius: cornerRadius,
            locations: locations?.toLocations())
    }
}

// MARK: - Helper & Common
extension GradientLayer {
    private func castToColors() -> [UIColor] {
        if let colors = self.colors {
            return colors.compactMap { color -> UIColor? in
                if color is CGColor {
                    let cgColor = color as! CGColor
                    return .init(cgColor: cgColor)
                } else {
                    return nil
                }
            }
        } else {
            return []
        }
    }
}

fileprivate extension Array where Element == NSNumber {
    func toLocations() -> [CGFloat] {
        return self.map { number in
            number.doubleValue.cgFloat
        }
    }
}
