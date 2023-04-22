//
//  ImageTextView.swift
//  Pods
//
//  Created by KniGht ThanaKorn on 9/6/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxSwift
import SnapKit
import UIKit

class ImageTextView: DefaultBaseView {

    struct Displayed {
        var source: SourceImage?
        var placeholderImage: UIImage?
        var text: String?
    }

    enum DisplayOption {
        case label(LabelOption)
        case image(ImageOption)
        case stack(StackViewOption)
    }

    enum LabelOption {
        case style(FeatLabel.Style)
        case textColor(UIColor)
        case textAlignment(NSTextAlignment)
        case numberOfLines(Int)
        case font(UIFont)
    }

    enum ImageOption {
        case tintColor(UIColor)
        case contentMode(UIView.ContentMode)
    }

    enum StackViewOption {
        case spacing(CGFloat)
        case axis(NSLayoutConstraint.Axis)
        case distribution(UIStackView.Distribution)
    }

    // MARK: - UI
    private let stackView: UIStackView = .init(frame: .zero)
    private let label: FeatLabel = .init()
    private let imageView: FeatImageView = .init()

    // MARK: - Constraints
    private var leftStackViewConstraint: Constraint?
    private var topStackViewConstraint: Constraint?
    private var rightStackViewConstraint: Constraint?
    private var bottomStackViewConstraint: Constraint?

    // MARK: - Constants
    private var increasePriority: Float = 3
    private var defaultLow: UILayoutPriority {
        .defaultLow + increasePriority
    }
    private var defaultHigh: UILayoutPriority {
        .defaultHigh + increasePriority
    }

    // MARK: - Data source

    // MARK: - Rx

    // MARK: - Output

    // MARK: - Cycle
    convenience init() {
        self.init(frame: .zero)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    // MARK: - Setup
    internal override func setupProperties() {
        makeDefaultOptions()
    }

    internal override func setupHierarchies() {
        addSubview(stackView)
        stackView.addArrangedSubviews([imageView, label])
    }

    internal override func setupConstraints() {
        label.snp.contentHuggingHorizontalPriority = defaultLow.rawValue
        label.snp.contentHuggingVerticalPriority = defaultLow.rawValue
        label.snp.contentCompressionResistanceHorizontalPriority = defaultHigh.rawValue
        label.snp.contentCompressionResistanceVerticalPriority = defaultHigh.rawValue
        stackView.snp.makeConstraints({ make in
            leftStackViewConstraint = make.left.equalToSuperview().constraint
            topStackViewConstraint = make.top.equalToSuperview().constraint
            rightStackViewConstraint = make.right.equalToSuperview().constraint
            bottomStackViewConstraint = make.bottom.equalToSuperview().constraint
            leftStackViewConstraint?.activate()
            topStackViewConstraint?.activate()
            rightStackViewConstraint?.activate()
            bottomStackViewConstraint?.activate()
        })
        imageView.snp.makeConstraints({ make in
            make.width.aspectRatioToSelf(imageView.snp.height, 1.0 / 1.0)
        })
    }

    func setupDisplayed(_ displayed: Displayed? = nil) {
        if let displayed = displayed {
            label.text = displayed.text
            setupImage(displayed)
        } else {
            label.text = nil
            imageView.image = nil
        }
    }

    func setupOptions(_ options: [DisplayOption]) {
        options.forEach { option in
            switch option {
            case let .label(option):
                setupLabelOption(option)

            case let .image(option):
                setupImageOption(option)

            case let .stack(option):
                setupStackView(option)
            }
        }
    }

    func updateText(_ text: String?) {
        label.text = text
    }

    func addView(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }

    func updateSpacing(_ inset: UIEdgeInsets) {
        leftStackViewConstraint?.update(inset: inset.left)
        topStackViewConstraint?.update(inset: inset.top)
        rightStackViewConstraint?.update(inset: inset.right)
        bottomStackViewConstraint?.update(inset: inset.bottom)
    }
}

// MARK: - Helper & Common
extension ImageTextView {
    func makeDefaultOptions() {
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .fill
        imageView.contentMode = .scaleAspectFit
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 1
        label.textColor = FeatColor.dark.color
        label.textAlignment = .left
    }

    private func setupImage(_ displayed: Displayed) {
        guard let source = displayed.source else {
            imageView.image = nil
            return
        }

        switch source {
        case let .network(url):
            imageView.setImage(
                source: url,
                placeholder: displayed.placeholderImage)

        case let .provider(image):
            imageView.image = image
        }
    }

    private func setupLabelOption(_ option: LabelOption) {
        switch option {
        case let .style(style):
            label.style = style

        case let .textColor(color):
            label.textColor = color

        case let .textAlignment(alignment):
            label.textAlignment = alignment

        case let .numberOfLines(lines):
            label.numberOfLines = lines

        case let .font(font):
            label.font = font
        }
    }

    private func setupImageOption(_ option: ImageOption) {
        switch option {
        case let .tintColor(color):
            imageView.tintColor = color

        case let .contentMode(contentMode):
            imageView.contentMode = contentMode
        }
    }

    private func setupStackView(_ option: StackViewOption) {
        switch option {
        case let .spacing(spacing):
            stackView.spacing = spacing

        case let .axis(axis):
            stackView.axis = axis

        case let .distribution(distribution):
            stackView.distribution = distribution
        }
    }
}
