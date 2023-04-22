//
//  AnalyticsManagerDependencies.swift
//  AcknowList
//
//  Created by Thanakorn Chongcharoenthanakul on 6/10/2565 BE.
//

import Foundation

 protocol AnalyticSceneableScreen: AnyObject {
    var screenType: AnalyticsScreenType? { get }
    var classType: String? { get }
}

 protocol AnalyticActionableScreen {
    associatedtype AnalyticLabels: AnalyticsParameterRepresentable
}

 protocol AnalyticsParameterRepresentable {
    var event: AnalyticsEvent? { get }
    var contentGroup: String? { get }
    var categoryId: String? { get }
    var itemId: String? { get }
    var durations: Int? { get }
    var channel: AnalyticsShare? { get }
    var price: Int? { get }
    var rotateFlag: AnalyticsRotate? { get }
}

extension AnalyticsParameterRepresentable {
     var event: AnalyticsEvent? { nil }
     var contentGroup: String? { nil }
     var categoryId: String? { nil }
     var itemId: String? { nil }
     var durations: Int? { nil }
     var channel: AnalyticsShare? { nil }
     var price: Int? { nil }
     var rotateFlag: AnalyticsRotate? { nil }
}

extension AnalyticsParameterRepresentable {
     func toModel() -> AnalyticsParameter? {
        return .init(
            contentGroup: contentGroup,
            categoryId: categoryId,
            itemId: itemId,
            durations: durations,
            channel: channel?.rawValue,
            price: price,
            rotateFlag: rotateFlag?.rawValue)
    }
}
