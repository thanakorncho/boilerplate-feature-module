//
//  AnalyticsManagerModel.swift

//
//  Created by Thanakorn Chongcharoenthanakul on 6/10/2565 BE.
//

// import FirebaseAnalytics
import Foundation

enum AnalyticsShare: String {
    case saveImage
    case facebook
    case instagram
    case line
    case twitter
    case more

    var rawValue: String {
        return AnalyticsConstants.share(self)
    }
}

enum AnalyticsRotate: String {
    case vertical
    case horizontal

    var rawValue: String {
        return AnalyticsConstants.rotate(self)
    }
}

enum AnalyticsAction {
    case click
    case viewAppeared
    case popupAppeared
    case success
    case failed
}

struct AnalyticsScreen {
    let screenName: String
    var className: String?

    var dictionary: [String: Any] {
        var dict: [String: Any] = ["AnalyticsParameterScreenName": screenName]
        if let className = className {
            dict.updateValue(className, forKey: "AnalyticsParameterScreenClass")
        }
        return dict
    }
}

enum AnalyticsScreenType {
    case login
    case landing
    case detail

    var screenName: String {
        return AnalyticsConstants.screenName(self)
    }

    func toScreen(_ className: String?) -> AnalyticsScreen {
        return .init(
            screenName: screenName,
            className: className)
    }
}

enum AnalyticsEvent: String {
    case logged
    case logout

    var rawValue: String {
        return AnalyticsConstants.event(self)
    }
}

struct AnalyticsParameter: Codable, AnalyticsParameterRepresentable {
    var contentGroup: String?
    var categoryId: String?
    var itemId: String?
    var durations: Int?
    var channel: String?
    var price: Int?
    var rotateFlag: String?
    var channelName: String?

    enum CodingKeys: String, CodingKey {
        case contentGroup = "content_group"
        case categoryId = "category_id"
        case itemId = "item_id"
        case durations
        case channel
        case price
        case rotateFlag
        case channelName = "name"
    }
}
