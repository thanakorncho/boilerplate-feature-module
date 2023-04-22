//
//  FeatLabel.swift

//
//  Created by KniGht ThanaKorn on 24/3/22.
//

import UIKit

class FeatLabel: UILabel {

    enum Style {
        case titleM
        case titleS
        case bodyM
        case bodyS
        case label(Display)
        case labelM
        case labelS
        case overline
    }

    enum Display {
        case normal
        case highlight
    }

    var style: Style? {
        didSet {
            setupStyle()
        }
    }

    // MARK: - Constants
    var rounded: Bool = false
    var contentInsets = UIEdgeInsets.zero

    var roundCorner: CommonView.RoundedCorner?

    // MARK: - Life Cycle
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

    override var intrinsicContentSize: CGSize {
        return addInsets(to: super.intrinsicContentSize)
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: contentInsets))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        makeRounded()
    }

    private func setup() {
        setupProperties()
        setupAccessibilityIds()
    }

    func setupProperties() {
    }

    func setupAccessibilityIds() {
    }

    func setupStyle() {
        guard let style = style else { return }

        defaultTextColor()
        switch style {
        case .titleM:
            font = .boldSystemFont(.regular)

        case .titleS:
            font = .systemFont(.tiny)

        case .bodyM:
            font = .systemFont(.regular)

        case .bodyS:
            font = .systemFont(.small)

        case .labelM:
            font = .boldSystemFont(.small)

        case .labelS:
            font = .boldSystemFont(.tiny)

        case let .label(display):
            font = .systemFont(.small)
            if display == .highlight {
                textColor = ThemeColor.text
            }

        case .overline:
            font = .boldSystemFont(.mini)
        }
    }
}

// MARK: - Helper & Common
extension FeatLabel {
    private func defaultTextColor() {
        textColor = ThemeColor.text
    }

    private func addInsets(to size: CGSize) -> CGSize {
        let width = size.width + contentInsets.left + contentInsets.right
        let height = size.height + contentInsets.top + contentInsets.bottom
        return .init(width: width, height: height)
    }

    private func makeRounded() {
        if rounded {
            roundCorners(
                roundCorner?.corners?.rectCorner ?? .allCorners,
                radius: roundCorner?.cornerRadius)
        } else {
            removeRoundedCorners()
        }
    }
}
