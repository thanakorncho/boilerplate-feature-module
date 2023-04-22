//
//  VerticalStackView.swift

//
//  Created by KniGht ThanaKorn on 24/3/22.
//

import UIKit

class VerticalStackView: UIStackView {

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
        axis = .vertical
        distribution = .fill
    }

    func setupAccessibilityIds() {
    }
}
