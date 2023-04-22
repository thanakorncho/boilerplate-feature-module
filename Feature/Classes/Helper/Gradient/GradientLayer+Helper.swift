//
//  GradientLayer+Helper.swift

//
//  Created by KniGht ThanaKorn on 19/10/22.
//

import Foundation

extension GradientLayer {
    func getStartAndEndPointsOf(
        _ direction: GradientDirection
    ) -> (startPoint: CGPoint, endPoint: CGPoint) {
        switch direction {
        case .leftToRight:
            return (
                .init(x: 0.0, y: 0.5),
                .init(x: 1.0, y: 0.5)
            )

        case .rightToLeft:
            return (
                .init(x: 1.0, y: 0.5),
                .init(x: 0.0, y: 0.5)
            )

        case .topToBottom:
            return (
                .init(x: 0.5, y: 0.0),
                .init(x: 0.5, y: 1.0)
            )

        case .bottomToTop:
            return (
                .init(x: 0.5, y: 1.0),
                .init(x: 0.5, y: 0.0)
            )

        case .topLeftToBottomRight:
            return (
                .zero,
                .init(x: 1.0, y: 1.0)
            )

        case .topRightToBottomLeft:
            return (
                .init(x: 1.0, y: .zero),
                .init(x: .zero, y: 1.0)
            )

        case .bottomLeftToTopRight:
            return (
                .init(x: 0.0, y: 1.0),
                .init(x: 1.0, y: 0.0)
            )

        case .bottomRightToTopLeft:
            return (
                .init(x: 1.0, y: 1.0),
                .zero
            )

        case let .custom(angle):
            return startAndEndPoints(from: angle)
        }
    }

    func startAndEndPoints(
        from angle: Int
    ) -> (startPoint:CGPoint, endPoint:CGPoint) {
        // Set default points for angle of 0°
        var startX: CGFloat = 0.5
        var startY: CGFloat = 1.0

        // Define point objects
        var startPoint: CGPoint
        var endPoint: CGPoint

        switch angle {
        case 0:
            startX = 0.5
            startY = 1.0

        case 45:
            startX = 0.0
            startY = 1.0

        case 90:
            startX = 0.0
            startY = 0.5

        case 135:
            startX = 0.0
            startY = 0.0

        case 180:
            startX = 0.5
            startY = 0.0

        case 225:
            startX = 1.0
            startY = 0.0

        case 270:
            startX = 1.0
            startY = 0.5

        case 315:
            startX = 1.0
            startY = 1.0
            // Define calculated points
        case _ where angle > 315 || angle < 45:
            startX = 0.5 - CGFloat(tan(angle.degreesToRadians) * 0.5)
            startY = 1.0

        case 45...135:
            startX = 0.0
            startY = 0.5 + CGFloat(tan(90.degreesToRadians - angle.degreesToRadians) * 0.5)

        case 135...225:
            startX = 0.5 - CGFloat(tan(180.degreesToRadians - angle.degreesToRadians) * 0.5)
            startY = 0.0

        case 225...359:
            startX = 1.0
            startY = 0.5 - CGFloat(tan(270.degreesToRadians - angle.degreesToRadians) * 0.5)

        default:
            break
        }

        // Build return CGPoints
        startPoint = CGPoint(x: startX, y: startY)
        endPoint = startPoint.opposite()
        return (startPoint, endPoint)
    }
}
