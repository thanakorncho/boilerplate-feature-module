//
//  FeatCollectionView.swift

//
//  Created by KniGht ThanaKorn on 28/3/22.
//

import Foundation

class FeatCollectionView: UICollectionView {

    var radius: CGFloat?

    convenience init() {
        self.init(frame: .zero, collectionViewLayout: .init())
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        makeRounded()
    }

    private func makeRounded() {
        guard let radius = radius else {
            return
        }

        withRoundedCorners(radius: radius)
    }
}
