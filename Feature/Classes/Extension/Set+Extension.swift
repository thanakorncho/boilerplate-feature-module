//
//  Set+Extension.swift

//
//  Created by KniGht ThanaKorn on 28/3/22.
//

import Foundation

extension Set where Element: Hashable {
    var array: [Element] {
        Array(self)
    }
}
