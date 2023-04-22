//
//  CACornerMask+Extension.swift

//
//  Created by KniGht ThanaKorn on 26/10/22.
//

import Foundation

extension CACornerMask {
    static var allCorners: Self {
        return [
            .layerMaxXMaxYCorner,
            .layerMaxXMinYCorner,
            .layerMinXMaxYCorner,
            .layerMinXMinYCorner
        ]
    }
}
