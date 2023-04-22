//
//  AVTRColor.swift

//
//  Created by KniGht ThanaKorn on 20/10/22.
//

import Foundation

public struct FeatureColor {

    // MARK: - Properties
    private(set) var dark: UIColor
    private(set) var light: UIColor
    private(set) var darks: [UIColor] = []
    private(set) var lights: [UIColor] = []
    private(set) var isGradient: Bool = false

    // MARK: - Setup
    init(light: UIColor, dark: UIColor) {
        self.light = light
        self.dark = dark
    }

    init(_ unified: UIColor) {
        self.light = unified
        self.dark = unified
    }

    init(light: [UIColor], dark: [UIColor]) {
        self.dark = .clear
        self.light = .clear
        self.lights = light
        self.darks = dark
        self.isGradient = true
    }

    init(_ unified: [UIColor]) {
        self.dark = .clear
        self.light = .clear
        self.lights = unified
        self.darks = unified
        self.isGradient = true
    }

    public func color() -> UIColor {
        return .init()
    }
}

fileprivate extension UIColor {
    static func toGradient(
        _ colors: [UIColor],
        frame: CGRect
    ) -> UIColor? {
        let color = UIColor.gradient(
            direction: .topRightToBottomLeft,
            frame: frame,
            colors: colors,
            locations: [0, 0.53, 1.0])
        return color
    }
}
