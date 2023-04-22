//
//  ActivityIndicatorView.swift
//  AcknowList
//
//  Created by KniGht ThanaKorn on 9/9/22.
//

import Foundation
import NVActivityIndicatorView

class ActivityIndicatorView: DefaultBaseView {
    // MARK: - UI
    private let stackView: VerticalStackView = .init()
    private let containerView: FeatView = .init()
    private let image: FeatImageView = .init()
    private let label: FeatLabel = .init()
    private let indicator: NVActivityIndicatorView = .init(frame: .zero)

    // MARK: - Constraints

    // MARK: - Constants

    // MARK: - Data source

    // MARK: - Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(cornerRadius: 24)
    }

    override func setupProperties() {
        super.setupProperties()
        backgroundColor = ThemeColor.background
        indicator.color = ThemeColor.link
        indicator.type = .ballPulse
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 1
        image.contentMode = .scaleAspectFit
        stackView.spacing = 16
    }

    override func setupHierarchies() {
        addSubview(stackView)
        containerView.addSubview(image)
        containerView.addSubview(indicator)
        stackView.addArrangedSubviews([
            containerView,
            label
        ])
    }

    override func setupConstraints() {
        let defaultLow = UILayoutPriority.defaultLow.rawValue
        let defaultHigh = UILayoutPriority.defaultHigh.rawValue
        label.snp.contentHuggingVerticalPriority = defaultLow + 3
        label.snp.contentHuggingHorizontalPriority = defaultLow + 3
        label.snp.contentCompressionResistanceVerticalPriority = defaultHigh + 3
        label.snp.contentCompressionResistanceHorizontalPriority = defaultHigh + 3
        stackView.snp.makeConstraints({ make in
            make.center.equalToSuperview()
//            make.right.equalToSuperview().inset(48)
            make.top.equalToSuperview().inset(32)
        })
        image.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        indicator.snp.makeConstraints({ make in
            make.center.equalToSuperview()
            make.right.equalToSuperview().inset(32)
            make.top.equalToSuperview().inset(32)
            make.width.equalTo(40)
            make.width.aspectRatioToSelf(
                indicator.snp.height,
                1.0 / 1.0)
        })
    }

    override func setupLocalizes() {
        label.text = L10n.commonLoadingLabel
//        image.image = FeatImage.Common.loading.image
        indicator.startAnimating()
    }
}
