//
//  FeatView.swift

//
//  Created by KniGht ThanaKorn on 30/3/22.
//

import Foundation

class FeatView: DefaultBaseView {

    // MARK: - Constants
    var isShadow: Bool = false
    var isGradient: Bool = false
    var isBorder: Bool = false

    // MARK: - Data source
    var shadow: CommonView.Shadow = .init()
    var gradient: CommonView.Gradient = .init(fromToColors: [])
    var roundCorner: CommonView.RoundedCorner = .init()
    var border: CommonView.Border?

    convenience init() {
        self.init(frame: .zero)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        displayRoundedCorner()
        displayShadow()
        displayGradient()
        displayBorder()
    }

    private func displayShadow() {
        if isShadow {
            addShadow(
                ofColor: shadow.ofColor ?? .black,
                radius: shadow.radius ?? 3,
                offset: shadow.offset ?? .zero,
                opacity: shadow.opacity ?? 0.5)
            shadowRasterize()
        } else {
            removeShadow()
        }
    }

    private func displayGradient() {
        if isGradient, gradient.fromToColors.isEmpty.not {
            gradient(gradient)
        } else {
            removeGradient()
        }
    }

    private func displayRoundedCorner() {
        if isRoundedCorners {
            let maskedCorners = getCornerMask()
            roundCorners(maskedCorners, cornerRadius: roundCorner.cornerRadius)
        } else {
            removeRoundedCorners()
        }
    }

    private func displayBorder() {
        if isBorder {
            borderColor = border?.color ?? ThemeColor.border
            borderWidth = border?.width ?? 1.0
        } else {
            borderColor = nil
            borderWidth = .zero
        }
    }

    func setShadow(shadow: CommonView.Shadow) {
        self.shadow = shadow
    }

    func setGradient(gradient: CommonView.Gradient) {
        self.gradient = gradient
    }

    func setRoundedCorner(corner: CommonView.RoundedCorner) {
        self.roundCorner = corner
    }
}

extension FeatView {
    private func getCornerMask() -> CACornerMask? {
        guard let corners = roundCorner.corners else {
            return nil
        }

        return corners.cornerMask
    }
}
