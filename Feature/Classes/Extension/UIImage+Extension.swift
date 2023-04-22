//
//  UIImage+Extension.swift

//
//  Created by Thanakorn Chongcharoenthanakul on 27/9/2565 BE.
//

import Foundation

public extension UIImage {

    enum CornerPoint {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }

    func scaleAspectRatio(_ targetSize: CGSize) -> CGSize {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height

        let scaleFactor = min(widthRatio, heightRatio)

        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        return scaledImageSize
    }

    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        let scaledImageSize = scaleAspectRatio(targetSize)

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }

        return scaledImage
    }

    func overlayWaterMark(
        image: UIImage = FeatImage.Common.Logo.chrome.image,
        padding: CGFloat = 36,
        scale: CGFloat = 2.0,
        position: CornerPoint = .bottomRight
    ) -> UIImage? {
        return overlayWith(
            image: image,
            position: position,
            padding: padding,
            scale: scale)
    }

    func overlayWith(
        image: UIImage,
        position: CornerPoint,
        padding: CGFloat? = nil,
        opaque: Bool = false,
        scale: CGFloat = 0.0
    ) -> UIImage? {
        let newSize = CGSize(width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(newSize, opaque, scale)

        draw(in: CGRect(origin: .zero, size: size))
        let rect = positionPoint(
            position,
            imageSize: image.size,
            padding: padding)
        image.draw(in: rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }

    private func positionPoint(
        _ position: CornerPoint,
        imageSize: CGSize,
        padding: CGFloat? = nil
    ) -> CGRect {
        var origin: CGPoint

        switch position {
        case .topLeft:
            origin = .init(x: 0.0, y: 0.0)

        case .topRight:
            origin = .init(
                x: size.width - imageSize.width,
                y: .zero)

        case .bottomLeft:
            origin = .init(
                x: .zero,
                y: size.height - imageSize.height)

        case .bottomRight:
            origin = .init(
                x: size.width - imageSize.width,
                y: size.height - imageSize.height)
        }

        if let padding = padding,
           origin.x.isZero,
           origin.y.isZero {
            origin.x += padding
            origin.y += padding
        } else if let padding = padding,
                  origin.x.isZero,
                  origin.y.isZero.not {
            origin.x += padding
            origin.y -= padding
        } else if let padding = padding,
                  origin.x.isZero.not,
                  origin.y.isZero {
            origin.x -= padding
            origin.y += padding
        } else if let padding = padding,
                  origin.x.isZero,
                  origin.y.isZero {
            origin.x -= padding
            origin.y -= padding
        }

        return .init(
            origin: origin,
            size: imageSize)
    }
}

// MARK: - Gradient
extension UIImage {
    static func gradient(
        _ gradient: CommonView.Gradient,
        frame: CGRect
    ) -> UIImage? {
        return UIImage.gradient(
            direction: gradient.direction,
            frame: frame,
            colors: gradient.fromToColors,
            cornerRadius: gradient.cornerRadius,
            locations: gradient.locations)
    }

    static func gradient(
        gradient: inout GradientLayer,
        frame: CGRect,
        scale: CGFloat = UIScreen.main.scale
    ) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, scale)

        guard let ctx = UIGraphicsGetCurrentContext() else { return nil }
        gradient.frame = frame
        gradient.render(in: ctx)

        guard
            let image = UIGraphicsGetImageFromCurrentImageContext()
        else {
            return nil
        }

        UIGraphicsEndImageContext()
        return image
    }

    static func gradient(
        direction: GradientDirection,
        frame: CGRect,
        colors: [UIColor],
        cornerRadius: CGFloat? = nil,
        locations: [CGFloat]? = nil
    ) -> UIImage? {
        var gradient = GradientLayer(
            direction: direction,
            colors: colors,
            cornerRadius: cornerRadius,
            locations: locations)
        return UIImage.gradient(gradient: &gradient, frame: frame)
    }
}
