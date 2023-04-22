//
//  HorizontalStackView.swift

//
//  Created by KniGht ThanaKorn on 24/3/22.
//

import UIKit

class HorizontalStackView: UIStackView {

    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        setupProperties()
        setupAccessibilityIds()
    }

    func setupProperties() {
        axis = .horizontal
        distribution = .fill
    }

    func setupAccessibilityIds() {
    }
}
