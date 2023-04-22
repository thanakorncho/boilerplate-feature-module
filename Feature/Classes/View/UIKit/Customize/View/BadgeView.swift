//
//  BadgeView.swift

//
//  Created by KniGht ThanaKorn on 18/7/22.
//

import Foundation

class BadgeView: DefaultBaseView {

    struct Displayed {
        var counter: Int
        var style: [CommonView.Style.Label]?
    }

    // MARK: - UI
    private let label: FeatLabel = .init()

    // MARK: - Constants

    // MARK: - Data source

    // MARK: - Life cycle
    convenience init() {
        self.init(frame: .zero)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func setupProperties() {
        isRoundedCorners = true
        backgroundColor = ThemeColor.background
        label.font = .systemFont(.mini)
        label.textColor = ThemeColor.primary
        label.numberOfLines = 1
        label.textAlignment = .center
    }

    override func setupHierarchies() {
        addSubview(label)
    }

    override func setupConstraints() {
        label.snp.makeConstraints({ make in
            make.edges.equalToSuperview().inset(.s2)
        })
    }

    func setupDisplayed(_ displayed: Displayed?) {
        if let displayed = displayed {
            label.text = representText(displayed.counter)
            setupStyle(displayed.style)
        } else {
            label.text = nil
        }
        label.layoutIfNeeded()
    }

    func setupStyle(_ styles: [CommonView.Style.Label]?) {
        guard let styles = styles, styles.isNotEmpty else { return }
        styles.forEach { style in
            switch style {
            case let .textColor(color):
                label.textColor = color

            case let .backgroundColor(color):
                backgroundColor = color

            case let .font(font):
                label.font = font

            default:
                break
            }
        }
    }
}

extension BadgeView {
    private func representText(_ counter: Int) -> String {
        if let plusSign = "99".plusSign, counter > 99 {
            return plusSign
        } else {
            return counter.string
        }
    }
}
