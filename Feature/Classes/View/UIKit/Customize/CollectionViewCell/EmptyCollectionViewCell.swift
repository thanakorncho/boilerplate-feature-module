//
//  EmptyCollectionViewCell.swift
//  Pods
//
//  Created by KniGht ThanaKorn on 20/6/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class EmptyCollectionViewCell: DeafultBaseCollectionViewCell {

    struct Displayed {
    }

    // MARK: - UI
    //    private let label: AVTRLabel = .init()
    //    private let button: AVTRButton = .init()

    // MARK: - Constraints

    // MARK: - Constants

    // MARK: - Data source

    // MARK: - Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func updateConstraints() {
        super.updateConstraints()
    }

    // MARK: - Setup
    internal override func setupProperties() {
    }

    internal override func setupHierarchies() {
    }

    internal override func setupConstraints() {
    }

    func setupDisplayed(_ displayed: Displayed? = nil) {
        if let displayed = displayed {
        } else {
        }
    }
}

// MARK: - Helper & Common
extension EmptyCollectionViewCell {
}
