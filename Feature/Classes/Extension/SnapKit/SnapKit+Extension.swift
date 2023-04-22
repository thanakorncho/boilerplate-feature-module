//
//  SnapKit+Extension.swift

//
//  Created by KniGht ThanaKorn on 26/3/22.
//

import Foundation
import SnapKit

extension ConstraintMakerRelatable {
    func aspectRatioToSelf(
        _ other: ConstraintRelatableTarget,
        _ ratio: Constants.ImageRatio
    ) {
        self.equalTo(other).multipliedBy(ratio.rawValue)
    }

    func aspectRatioToSelf(
        _ other: ConstraintRelatableTarget,
        _ ratio: ConstraintMultiplierTarget
    ) {
        self.equalTo(other).multipliedBy(ratio)
    }
}
