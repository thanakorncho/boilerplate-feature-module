//
//  TitleHeaderCollectionViewCell.swift

//
//  Created by KniGht ThanaKorn on 24/3/22.
//

import UIKit

class TitleHeaderCollectionViewCell: UICollectionReusableView {

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
    override var reuseIdentifier: String? {
        return String(describing: type(of: self))
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(
            width: layoutAttributes.frame.width,
            height: 0)
        layoutAttributes.frame.size = systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel)
        return layoutAttributes
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
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
        addSubview(label)
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
extension TitleHeaderCollectionViewCell {
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
extension TitleHeaderCollectionViewCell {
}
