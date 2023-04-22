//
//  CGRect+Extension.swift

//
//  Created by KniGht ThanaKorn on 24/6/22.
//

import Foundation

extension CGRect {
    var minEdge: CGFloat {
        return min(width, height)
    }
}
