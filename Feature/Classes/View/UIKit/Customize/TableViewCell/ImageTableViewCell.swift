//
//  ImageTableViewCell.swift

//
//  Created by KniGht ThanaKorn on 11/7/22.
//

import Foundation
import Kingfisher
import SnapKit

class ImageTableViewCell: DefaultBaseTableViewCell {

    struct Displayed {
        let source: SourceImage
        var placeholder: UIImage?
        var spacing: UIEdgeInsets?
    }

    // MARK: - UI
    private let previewImageView: FeatImageView = .init()

    // MARK: - Constraints
    private var imageLeftConstraint: Constraint?
    private var imageTopConstraint: Constraint?
    private var imageRightConstraint: Constraint?
    private var imageBottomConstraint: Constraint?

    // MARK: - Constants
    private let screen = UIScreen.main.bounds

    // MARK: - Data source

    // MARK: - Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        previewImageView.clipsToBounds = true
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        previewImageView.image = nil
    }

    override func setupProperties() {
        previewImageView.contentMode = .scaleAspectFill
    }

    override func setupHierarchies() {
        contentView.addSubview(previewImageView)
    }

    override func setupConstraints() {
        previewImageView.snp.makeConstraints({ make in
            make.height.equalTo(screen.height * 0.35)
            imageLeftConstraint = make.left.equalToSuperview().constraint
            imageTopConstraint = make.top.equalToSuperview().constraint
            imageRightConstraint = make.right.equalToSuperview().constraint
            imageBottomConstraint = make.bottom.equalToSuperview().constraint
            imageLeftConstraint?.activate()
            imageTopConstraint?.activate()
            imageRightConstraint?.activate()
            imageBottomConstraint?.activate()
        })
    }

    // MARK: - Setup
    func setupDisplayed(_ displayed: Displayed? = nil) {
        if let displayed = displayed {
            switch displayed.source {
            case let .network(url):
                updateSpacing(displayed.spacing)
                previewImageView.setImage(
                    source: url,
                    placeholder: displayed.placeholder,
                    options: [
                        .processor(
                            DownsamplingImageProcessor(size: contentView.size)
                        )
                    ])

            case let .provider(image):
                previewImageView.image = image
            }
        } else {
            previewImageView.image = nil
        }
    }
}

// MARK: - Helper & Common
extension ImageTableViewCell {
    private func updateSpacing(_ spacing: UIEdgeInsets?) {
        guard let spacing = spacing else {
            return
        }

        imageLeftConstraint?.update(inset: spacing.left)
        imageTopConstraint?.update(inset: spacing.top)
        imageRightConstraint?.update(inset: spacing.right)
        imageBottomConstraint?.update(inset: spacing.bottom)
    }
}
