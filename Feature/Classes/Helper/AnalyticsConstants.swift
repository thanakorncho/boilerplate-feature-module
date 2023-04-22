//
//  AnalyticsConstants.swift

//
//  Created by Thanakorn Chongcharoenthanakul on 6/10/2565 BE.
//

import Foundation

struct AnalyticsConstants {
    static var contentGroup = "feature"

    static func screenName(_ screen: AnalyticsScreenType) -> String {
        switch screen {
        case .login:
            return "login"
        case .landing:
            return "landing"
        case .detail:
            return "detail"
        }
    }

    static func share(_ share: AnalyticsShare) -> String {
        switch share {
        case .saveImage:
            return "save_image"
        case .facebook:
            return "facebook"
        case .instagram:
            return "instagram"
        case .line:
            return "line"
        case .twitter:
            return "twitter"
        case .more:
            return "more"
        }
    }

    static func rotate(_ rotate: AnalyticsRotate) -> String {
        switch rotate {
        case .vertical:
            return "vertical"
        case .horizontal:
            return "horizontal"
        }
    }

    static func action(_ action: AnalyticsAction) -> String {
        switch action {
        case .click:
            return "clicked"
        case .viewAppeared:
            return "viewed"
        case .popupAppeared:
            return "popup_show"
        case .success:
            return "success"
        case .failed:
            return "failed"
        }
    }
}

extension AnalyticsConstants {
    static func event(_ event: AnalyticsEvent) -> String {
        switch event {
        case .logged:
            return "logged"
        case .logout:
            return "logout"
        }
    }
}
