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
//    private let label: UILabel = .init(frame: .zero)
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

    }

    internal override func setupHierarchies() {

    }

    internal override func setupConstraints() {

    }

    internal override func setupLocalizes() {

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

