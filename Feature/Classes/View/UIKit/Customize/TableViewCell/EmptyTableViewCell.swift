//
//  EmptyTableViewCell.swift
//  Pods
//
//  Created by KniGht ThanaKorn on 10/6/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class EmptyTableViewCell: DefaultBaseTableViewCell {

    struct Displayed {
    }

    struct Events {
    }

    // MARK: - UI
    //    private let label: AVTRLabel = .init()
    //    private let button: AVTRButton = .init()

    // MARK: - Constraints

    // MARK: - Constants

    // MARK: - Data source

    // MARK: - Rx

    // MARK: - Output
    var event: Events {
        .init()
    }

    // MARK: - Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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

// MARK: - Helper & Common
extension EmptyTableViewCell {
}
