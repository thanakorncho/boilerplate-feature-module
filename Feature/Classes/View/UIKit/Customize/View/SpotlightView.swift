//
//  SpotlightView.swift
//  Pods
//
//  Created by KniGht ThanaKorn on 21/7/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Kingfisher
import RxCocoa
import RxSwift
import UIKit

class SpotlightView: FeatView {

    private typealias Object = SpotlightView

    struct Displayed {
        let image: SourceImage
        var frame: UIImage?
        let index: Int
    }

    // MARK: - UI
    private let imageView: FeatImageView = .init()
    private let frameImageView: FeatImageView = .init()

    // MARK: - Constraints

    // MARK: - Constants
    private let screen = UIScreen.main.bounds
    private let imageRatio: CGFloat = 1.0 / 1.0

    // MARK: - Data source
    private var index: Int?

    // MARK: - Rx
    private let onTapRelay = PublishRelay<Int>()

    // MARK: - Output
    var onTap: ControlEvent<Int> {
        .init(events: onTapRelay)
    }

    // MARK: - Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.rounded = true
        frameImageView.rounded = true
    }

    // MARK: - Setup
    internal override func setupProperties() {
        super.setupProperties()
        imageView.contentMode = .scaleAspectFit
        frameImageView.contentMode = .scaleAspectFit
    }

    internal override func setupHierarchies() {
        addSubview(imageView)
        addSubview(frameImageView)
        bringSubviewToFront(frameImageView)
    }

    internal override func setupConstraints() {
        frameImageView.snp.makeConstraints({ make in
            make.width.equalTo(screen.width * 0.04)
            make.edges.equalToSuperview()
        })
        imageView.snp.makeConstraints({ make in
            make.width.equalTo(frameImageView).multipliedBy(0.8)
            make.width.aspectRatioToSelf(
                imageView.snp.height,
                imageRatio)
            make.center.equalTo(frameImageView)
        })
    }

    internal override func setupEvent() {
        self.rx.tapGesture()
            .throttle(.milliseconds(1500), scheduler: MainScheduler.instance)
            .withUnretained(self)
            .compactMap(transformToIndex)
            .bind(to: onTapRelay)
            .disposed(by: disposeBag)
    }

    func setupDisplayed(_ displayed: Displayed? = nil) {
        if let displayed = displayed {
            index = displayed.index
            let size = CGSize(
                width: screen.width * 0.04,
                height: screen.width * 0.04)
            imageView.setImage(
                source: displayed.image,
                placeholder: FeatImage.Common.Logo.lego.image,
                options: [
                    .processor(
                        DownsamplingImageProcessor(size: size)
                    )
                ])
            frameImageView.image = displayed.frame
        } else {
            index = nil
            imageView.image = nil
            frameImageView.image = nil
        }
        imageView.layoutIfNeeded()
        self.layoutSubviews()
    }
}

// MARK: - Binder (Input)
extension SpotlightView {
}

// MARK: - Helper & Common
extension SpotlightView {
    private var transformToIndex: (Object, UITapGestureRecognizer) -> Int? {
        return { owner, _ in
            guard let index = owner.index else {
                return nil
            }

            return index
        }
    }
}
