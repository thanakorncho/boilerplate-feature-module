//
//  ActionTracker.swift

//
//  Created by Thanakorn Chongcharoenthanakul on 6/10/2565 BE.
//

import Foundation

class ActionTracker<T: AnalyticsParameterRepresentable> {

    // MARK: - Dependencies
    private weak var sceneTracker: SceneTracker?

    init(
        sceneTracker: SceneTracker
    ) {
        self.sceneTracker = sceneTracker
    }

    func track(action: AnalyticsAction, label: T) {
        guard let event = label.event else {
            return
        }

        sceneTracker?.trackActions(
            action: action,
            label: event.rawValue,
            parameters: label)
    }
}
