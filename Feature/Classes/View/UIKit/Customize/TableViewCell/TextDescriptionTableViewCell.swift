//
//  TextDescriptionTableViewCell.swift
//  Pods
//
//  Created by KniGht ThanaKorn on 9/6/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class TextDescriptionTableViewCell: DefaultBaseTableViewCell {

    struct Displayed {
        let title: String
        let description: String
    }

    // MARK: - UI
    private let textDescView: TextDescriptionView = .init()

    // MARK: - Constraints

    // MARK: - Constants

    // MARK: - Data source

    // MARK: - Rx

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
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }

    internal override func setupHierarchies() {
        contentView.addSubview(textDescView)
    }

    internal override func setupConstraints() {
        textDescView.snp.makeConstraints({ make in
            make.left.right.equalToSuperview().offset(0)
            make.top.bottom.equalToSuperview().offset(0)
        })
    }

    func setupDisplayed(_ displayed: Displayed? = nil) {
        if let displayed = displayed {
            textDescView.setupDisplayed(displayed.toDisplayed())
        } else {
        }
    }
}

// MARK: - Helper & Common
extension TextDescriptionTableViewCell {
}

private extension TextDescriptionTableViewCell.Displayed {
    func toDisplayed() -> TextDescriptionView.Displayed {
        return .init(
            title: .init(text: title),
            description: .init(text: description))
    }
}
