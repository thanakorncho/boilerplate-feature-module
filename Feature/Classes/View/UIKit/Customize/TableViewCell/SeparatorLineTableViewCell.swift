//
//  SeparatorLineTableViewCell.swift
//  Pods
//
//  Created by KniGht ThanaKorn on 9/6/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SnapKit
import UIKit

class SeparatorLineTableViewCell: DefaultBaseTableViewCell {

    struct Displayed {
        let backgroundColor: UIColor
        var spacing: CGFloat

        static var `default`: Displayed {
            return .init(
                backgroundColor: ThemeColor.border,
                spacing: .zero)
        }
    }

    // MARK: - UI
    private let separatorView: FeatView = .init()

    // MARK: - Constraints
    private var spacingSeparatorConstraints: Constraint?

    // MARK: - Constants

    // MARK: - Data source

    // MARK: - Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    // MARK: - Setup
    internal override func setupProperties() {
        backgroundColor = .clear
    }

    internal override func setupHierarchies() {
        addSubview(separatorView)
    }

    internal override func setupConstraints() {
        separatorView.snp.makeConstraints({ make in
            make.top.bottom.equalToSuperview()
            make.height.equalTo(1)
            spacingSeparatorConstraints = make.left.right.equalToSuperview().constraint
            spacingSeparatorConstraints?.activate()
        })
    }

    func setupDisplayed(_ displayed: Displayed? = nil) {
        if let displayed = displayed {
            separatorView.backgroundColor = displayed.backgroundColor
            spacingSeparatorConstraints?.update(inset: displayed.spacing)
        } else {
            separatorView.backgroundColor = .clear
            spacingSeparatorConstraints?.update(inset: 0)
        }
    }
}

// MARK: - Helper & Common
extension SeparatorLineTableViewCell {
}
