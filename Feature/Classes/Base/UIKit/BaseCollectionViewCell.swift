//
//  BaseDeafultCollectionView.swift

//
//  Created by KniGht ThanaKorn on 17/3/22.
//

import Foundation
import RxSwift

open class DeafultBaseCollectionViewCell: UICollectionViewCell, BaseView {

    var disposeBag = DisposeBag()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        setupProperties()
        setupNavigation()
        setupHierarchies()
        setupConstraints()
        setupLocalizes()
        setupEvent()
        setupAccessibilityIds()
    }

    func setupProperties() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }

    func setupNavigation() {
    }

    func setupHierarchies() {
    }

    func setupConstraints() {
    }

    func setupLocalizes() {
    }

    func setupEvent() {
    }

    func setupAccessibilityIds() {
    }
}
