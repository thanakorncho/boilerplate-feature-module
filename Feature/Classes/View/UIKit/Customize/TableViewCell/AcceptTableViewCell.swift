//
//  AcceptTableViewCell.swift
//  Pods
//
//  Created by KniGht ThanaKorn on 24/8/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class AcceptTableViewCell: DefaultBaseTableViewCell {

    struct Displayed {
        let title: String
    }

    struct Events {
        let onTap: ControlEvent<Void>
    }

    // MARK: - UI
    private let button: FeatContainedButton = .init()

    // MARK: - Constraints

    // MARK: - Constants

    // MARK: - Data source

    // MARK: - Rx

    // MARK: - Output
    var event: Events {
        .init(
            onTap: button.rx.tap
        )
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
        disposeBag = DisposeBag()
    }

    override func updateConstraints() {
        super.updateConstraints()
    }

    // MARK: - Setup
    internal override func setupProperties() {
        button.style = .main
    }

    internal override func setupHierarchies() {
        contentView.addSubview(button)
    }

    internal override func setupConstraints() {
        button.snp.makeConstraints({ make in
            make.top.bottom.equalToSuperview().inset(16)
            make.left.right.equalToSuperview().inset(72)
        })
    }

    func setupDisplayed(_ displayed: Displayed? = nil) {
        if let displayed = displayed {
            button.titleForNormal = displayed.title
        } else {
            clear()
        }
    }
}

// MARK: - Helper & Common
extension AcceptTableViewCell {
    private func clear() {
        button.titleForNormal = nil
    }
}
