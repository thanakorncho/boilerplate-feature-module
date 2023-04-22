//
//  TextDescriptionView.swift
//  Pods
//
//  Created by KniGht ThanaKorn on 13/6/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class TextDescriptionView: DefaultBaseView {

    struct Displayed {
        let title: Label
        var description: Label?
        var spacing: CGFloat?
    }

    struct Label {
        var text: String?
        var attributeText: NSAttributedString?
        var styles: [CommonView.Style.Label]?
    }

    // MARK: - UI
    private let stackView: VerticalStackView = .init()
    private let titleLabel: FeatLabel = .init()
    private let descLabel: FeatLabel = .init()

    // MARK: - Constraints

    // MARK: - Constants
    private let defaultLow = UILayoutPriority.defaultLow
    private let defaultHigh = UILayoutPriority.defaultHigh

    // MARK: - Data source

    // MARK: - Rx

    // MARK: - Cycle
    convenience init() {
        self.init(frame: .zero)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    // MARK: - Setup
    internal override func setupProperties() {
        backgroundColor = .clear
        stackView.spacing = Constants.spacer(.s4)
        titleLabel.textColor = ThemeColor.text
        titleLabel.textAlignment = .left
        titleLabel.font = .boldSystemFont(.tiny)
        titleLabel.numberOfLines = 1
        descLabel.textColor = ThemeColor.text
        descLabel.font = .systemFont(.tiny)
        descLabel.numberOfLines = 0
        descLabel.textAlignment = .left
    }

    internal override func setupHierarchies() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descLabel)
    }

    internal override func setupConstraints() {
        let defaultLow = self.defaultLow + 4
        let defaultHigh = self.defaultHigh + 4
        titleLabel.snp.contentHuggingVerticalPriority = defaultLow.rawValue
        titleLabel.snp.contentHuggingHorizontalPriority = defaultLow.rawValue
        titleLabel.snp.contentCompressionResistanceVerticalPriority = defaultHigh.rawValue
        titleLabel.snp.contentCompressionResistanceHorizontalPriority = defaultHigh.rawValue
        stackView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
    }

    func setupDisplayed(_ displayed: Displayed? = nil) {
        if let displayed = displayed {
            setupTitle(displayed.title)
            setupDescription(displayed.description)
            if let spacing = displayed.spacing {
                stackView.spacing = spacing
            }
        } else {
            titleLabel.text = nil
            descLabel.text = nil
        }
    }
}

// MARK: - Helper & Common
extension TextDescriptionView {
    private func setupTitle(_ label: Label) {
        setupText(
            label: titleLabel,
            text: label.text,
            attributedText: label.attributeText)
        setupStyleLabel(
            label: titleLabel,
            styles: label.styles)
    }

    private func setupDescription(_ label: Label?) {
        setupText(
            label: descLabel,
            text: label?.text,
            attributedText: label?.attributeText)
        setupStyleLabel(
            label: descLabel,
            styles: label?.styles)
    }

    private func setupStyleLabel(
        label: FeatLabel,
        styles: [CommonView.Style.Label]?
    ) {
        guard let styles = styles, styles.isNotEmpty else {
            return
        }

        styles.forEach { style in
            switch style {
            case let .style(style):
                label.style = style

            case let .alignment(alignment):
                label.textAlignment = alignment

            case let .textColor(color):
                label.textColor = color

            case let .font(font):
                label.font = font

            case let .lines(lines):
                label.numberOfLines = lines

            case let .insets(insets):
                label.contentInsets = insets
                label.layoutIfNeeded()

            default:
                break
            }
        }
    }

    private func setupText(
        label: FeatLabel,
        text: String?,
        attributedText: NSAttributedString?
    ) {
        label.isHidden = false
        if let text = text {
            label.text = text
        } else if let attributedText = attributedText {
            label.attributedText = attributedText
        } else {
            label.text = nil
            label.attributedText = nil
            label.isHidden = true
        }
    }
}
