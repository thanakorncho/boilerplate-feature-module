//
//  FeatThumbView.swift

//
//  Created by Thanakorn Chongcharoenthanakul on 1/3/2566 BE.
//

import Foundation

final class FeatThumbView: FeatView {
    // MARK: - UI
    private var imageView: FeatImageView = .init()

    // MARK: - Constants
    var imageTintColor: UIColor?
    var cornerRadiusScale: CGFloat?
    var showShadow: Bool = false

    // MARK: - Data source
    var image: UIImage? {
        didSet {
            setupImage(image)
        }
    }

    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    internal override func setup() {
        setupProperties()
        setupHierarchies()
        setupConstraints()
    }

    internal override func setupProperties() {
        isShadow = true
        isRoundedCorners = true
        isUserInteractionEnabled = false
        imageView.isUserInteractionEnabled = false
        imageView.contentMode = .center
        imageView.backgroundColor = .clear
    }

    internal override func setupHierarchies() {
        addSubview(imageView)
    }

    internal override func setupConstraints() {
        imageView.snp.makeConstraints({ make in
            make.edges.equalToSuperview().inset(4)
        })
    }

    private func setupImage(_ image: UIImage?) {
        var isTint: Bool = false
        if let tintColor = imageTintColor {
            isTint = true
            imageView.tintColor = tintColor
        }

        imageView.image = isTint ? image?.template : image
    }
}

// MARK: - Helper
extension FeatThumbView {
}
