//
//  IndicatorImage.swift

//
//  Created by KniGht ThanaKorn on 15/6/22.
//

import Foundation
import Kingfisher

struct IndicatorImage: Indicator {
    let view: UIView = UIView()

    func startAnimatingView() { view.isHidden = false }
    func stopAnimatingView() { view.isHidden = true }

    init() {
        view.backgroundColor = .red
    }
}
