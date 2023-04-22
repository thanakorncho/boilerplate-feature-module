//
//  FeatImageView.swift

//
//  Created by KniGht ThanaKorn on 26/5/22.
//

import Foundation

final class FeatImageView: UIImageView {

    enum Style {
        case primary
        case secondary
    }

    // MARK: - Constants
    var radius: CGFloat?
    var maxWidth: CGFloat?
    var rounded: Bool = false
    var isGradient: Bool = false
    var isGradientBackground: Bool = false
    var isBorder: Bool = false

    var gradient: CommonView.Gradient?
    var border: CommonView.Border?

    // MARK: - Data source
    var style: Style? {
        didSet {
            setupStyle()
        }
    }

    // MARK: - Life cycle
    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundedCornersProcess()
        gradientProcess()
        borderProcess()
    }

    private func setup() {
        setupProperties()
        setupHierarchies()
        setupConstraints()
        setupLocalizes()
        setupEvent()
        setupAccessibilityIds()
    }

    func setupProperties() {
    }

    func setupHierarchies() {
    }

    func setupConstraints() {
    }

    func setupLocalizes() {
    }

    func setupEvent() {
    }

    func setupAccessibilityIds() {
    }

    func setupStyle() {
        guard let style = style else { return }

        switch style {
        case .primary:
            tintColor = ThemeColor.link

        case .secondary:
            tintColor = ThemeColor.link
        }
    }
}

extension FeatImageView {
    private func roundedCornersProcess() {
        if rounded {
            roundCorners(.allCorners, radius: radius)
        } else {
            removeRoundedCorners()
        }
    }

    private func gradientProcess() {
        if let gradient = gradient, isGradient {
            self.gradient(gradient)
        } else if let gradient = gradient, isGradientBackground {
            backgroundColor = UIColor.gradient(
                gradient,
                frame: frame)
        } else {
            removeGradient()
        }
    }

    private func borderProcess() {
        if let border = border, isBorder {
            borderColor = border.color
            borderWidth = border.width
        } else {
            removeBorder()
        }
    }
}
