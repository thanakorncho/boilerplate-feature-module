//
//  ForgotPasswordView.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 23/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class ForgotPasswordView:
    DefaultBaseView {

    internal typealias Model = ForgotPasswordModels

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
    var events: Events {
        return .init()
    }

    // MARK: - Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    // MARK: - Setup
    internal override func setupProperties() {
        backgroundColor = .white
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
extension ForgotPasswordView {

}

// MARK: - Helper
extension ForgotPasswordView {

}

// MARK: - Common
extension ForgotPasswordView {

}

