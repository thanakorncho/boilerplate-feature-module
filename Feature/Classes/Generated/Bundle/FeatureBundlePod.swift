//
//  FeatureBundlePod.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 20/4/2566 BE.
//

import Foundation

final class FeatureBundlePod {
    // This is the bundle where your code resides in
    static let bundle = Bundle(for: FeatureBundlePod.self)

    // Your resources bundle is inside that bundle
    static let resourcesBundle: Bundle = {
        guard let url = bundle.url(forResource: "Feature-Assets", withExtension: "bundle"),
              let bundle = Bundle(url: url) else {
            fatalError("Can't find 'Feature-Assets' bundle")
        }
        return bundle
    }()
}
