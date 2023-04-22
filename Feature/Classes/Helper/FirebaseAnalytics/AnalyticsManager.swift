//
//  AnalyticsManager.swift
//  AcknowList
//
//  Created by Thanakorn Chongcharoenthanakul on 5/10/2565 BE.
//

// import FirebaseAnalytics
import Foundation

struct AnalyticsManager {
    static func trackActions(
        action: AnalyticsAction,
        label: String,
        parameters: AnalyticsParameter?
    ) {
//        Analytics.logEvent(label, parameters: parameters?.dictionary)
    }

    static func trackScreens(
        screen: AnalyticsScreen,
        customDimensions: AnalyticsParameter?
    ) {
        var parameters = screen.dictionary
//        Analytics.logEvent(
//            AnalyticsEventScreenView,
//            parameters: parameters.updateValue(customDimensions))
    }
}

private extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any {
    @discardableResult
    mutating func updateValue(_ customDimensions: AnalyticsParameter?) -> [Key: Value] {
        guard
            let parameters = customDimensions?.dictionary,
            parameters.isEmpty.not
        else {
            return self
        }

        return self.updateValue(parameters)
    }

    @discardableResult
    mutating func updateValue(_ newValue: [String: Any]) -> [Key: Value] {
        newValue.forEach { key, value in
            if let key = key as? Key, let value = value as? Value {
                self.updateValue(value, forKey: key)
            }
        }
        return self
    }
}
