//
//  SeparatorLineView.swift
//  Pods
//
//  Created by KniGht ThanaKorn on 13/6/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class SeparatorLineView: DefaultBaseView {

    struct Displayed {
    }

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
        .init()
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

    func setupDisplayed(_ displayed: Displayed? = nil) {
        if let displayed = displayed {
        } else {
        }
    }
}

// MARK: - Binder (Input)
extension SeparatorLineView {
}

// MARK: - Helper & Common
extension SeparatorLineView {
}
