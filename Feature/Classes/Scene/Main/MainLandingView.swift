//
//  MainLandingView.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class MainLandingView:
    DefaultBaseView {

    internal typealias Model = MainLandingModels

    struct Events {
    }

    // MARK: - UI
    private let label: FeatLabel = .init()
//    private let button: UIButton = .init(frame: .zero)

    // MARK: - Constraints

    // MARK: - Constants

    // MARK: - Data source

    // MARK: - Rx

    // MARK: - Output
    func transform() -> Events {
        return .init()
    }

    // MARK: - Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    // MARK: - Setup
    internal override func setupProperties() {
        backgroundColor = .white
        label.font = .boldSystemFont(.huge)
        label.textColor = ThemeColor.text
        label.textAlignment = .left
        label.numberOfLines = 2
    }

    internal override func setupHierarchies() {
        addSubview(label)
    }

    internal override func setupConstraints() {
        label.snp.makeConstraints({ make in
            make.left.right.equalToSuperview().inset(.s16)
            make.centerY.equalToSuperview()
        })
    }

    internal override func setupLocalizes() {
        label.text = .loremIpsum()
    }

    internal override func setupEvent() {
    }

    func setupDisplayed(_ displayed: Model.Displayed? = nil) {
        if let displayed = displayed {
        } else {
        }
    }
}

// MARK: - Binder (Input)
extension MainLandingView {
}

// MARK: - Helper
extension MainLandingView {
}

// MARK: - Common
extension MainLandingView {
}
