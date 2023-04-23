//
//  LoginView.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxSwift
import UIKit
import RxCocoa

class LoginView:
    DefaultBaseView {

    internal typealias Model = LoginModels

    struct Events {
        var loggedIn: ControlEvent<Void>
    }

    // MARK: - UI
    private let label: FeatLabel = .init()
    private let button: FeatTextButton = .init()

    // MARK: - Constraints

    // MARK: - Constants

    // MARK: - Data source

    // MARK: - Rx

    // MARK: - Output
    var event: Events {
        return .init(
            loggedIn: button.rx.tap
        )
    }

    // MARK: - Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    // MARK: - Setup
    internal override func setupProperties() {
        backgroundColor = ThemeColor.background
        label.style = .titleM
        label.textAlignment = .center
        button.style = .main
        button.backgroundColorForNormal = .orange
    }

    internal override func setupHierarchies() {
        addSubview(label)
        addSubview(button)
    }

    internal override func setupConstraints() {
        label.snp.makeConstraints({ make in
            make.center.equalToSuperview()
        })
        button.snp.makeConstraints({ make in
            make.top.equalTo(label.snp.bottom).offset(.s16)
            make.centerX.equalToSuperview()
        })
    }

    internal override func setupLocalizes() {
        label.text = "Login Screen"
        button.setTitle("Logged In", for: .normal)
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
extension LoginView {
}

// MARK: - Helper
extension LoginView {
}

// MARK: - Common
extension LoginView {
}
