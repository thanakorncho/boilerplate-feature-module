//
//  TitleHeaderTableViewCell.swift

//
//  Created by KniGht ThanaKorn on 16/3/22.
//

import UIKit

class TitleHeaderTableViewCell: UITableViewHeaderFooterView {

    struct Displayed {
        let title: String
        var font: UIFont?
        var color: UIColor?
    }

    // MARK: - UI
    private let label: UILabel = .init(frame: .zero)

    // MARK: - Constants

    // MARK: - Rx

    // MARK: - Life Cycle
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }

    // MARK: - Setup
    private func setup() {
        setupProperties()
        setupHierarchies()
        setupConstraints()
        setupLocalizes()
    }

    private func setupProperties() {
        label.font = .systemFont(ofSize: 12)
        label.textColor = FeatColor.dark.color
        label.textAlignment = .left
        label.numberOfLines = 1
    }

    private func setupHierarchies() {
        contentView.addSubview(label)
    }

    private func setupConstraints() {
        label.snp.makeConstraints({ maker in
            maker.left.right.equalToSuperview().inset(16)
            maker.top.bottom.equalToSuperview().inset(8)
        })
    }

    private func setupLocalizes() {
    }

    func setupDisplayed(_ displayed: Displayed? = nil) {
        if let displayed = displayed {
            label.text = displayed.title
            setupFont(displayed.font)
            setupColor(displayed.color)
        } else {
            label.text = nil
        }
        label.layoutIfNeeded()
    }
}

// MARK: - Helper
extension TitleHeaderTableViewCell {
    private func setupColor(_ color: UIColor?) {
        guard let color = color else {
            return
        }

        label.textColor = color
    }

    private func setupFont(_ font: UIFont?) {
        guard let font = font else {
            return
        }

        label.font = font
    }
}

// MARK: - Common
extension TitleHeaderTableViewCell {
}
