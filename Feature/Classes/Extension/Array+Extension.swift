//
//  Array+Extension.swift

//
//  Created by KniGht ThanaKorn on 28/3/22.
//

import Foundation

extension Array {
    var isNotEmpty: Bool {
        self.isEmpty.not
    }
}

extension Array where Element: Hashable {
    var set: Set<Element> {
        return Set(self)
    }
}
