//
//  SceneTracker.swift
//  AcknowList
//
//  Created by Thanakorn Chongcharoenthanakul on 5/10/2565 BE.
//

import Foundation

protocol SceneTrackerDependencies {
    func actionTracker<T: AnalyticActionableScreen>(_ type: T.Type) -> ActionTracker<T.AnalyticLabels>
    func trackScreen()
    func trackScreen(parameters: AnalyticsParameterRepresentable?)
}

class SceneTracker: SceneTrackerDependencies {

    // MARK: - Constants
    private var isSetClassName: Bool = false

    // MARK: - Dependencies
    private weak var screen: AnalyticSceneableScreen?

    // MARK: - Life Cycle
    init() {}

    init(screen: AnalyticSceneableScreen) {
        self.screen = screen
    }

    // MARK: - Interface
    func actionTracker<T: AnalyticActionableScreen>(_ type: T.Type) -> ActionTracker<T.AnalyticLabels> {
        return ActionTracker<T.AnalyticLabels>(sceneTracker: self)
    }

    func trackScreen() {
        trackScreen(parameters: nil)
    }

    func trackScreen(parameters: AnalyticsParameterRepresentable?) {
        guard let screen = screen, let type = screen.screenType else { return }
        AnalyticsManager.trackScreens(
            screen: type.toScreen(makeClassName()),
            customDimensions: parameters?.toModel())
    }

    // MARK: - Internal Interface
    func trackActions(
        action: AnalyticsAction = .click,
        label: String,
        parameters: AnalyticsParameterRepresentable? = nil
    ) {
        AnalyticsManager.trackActions(
            action: action,
            label: label,
            parameters: parameters?.toModel())
    }
}

// MARK: - Helper & Common
extension SceneTracker {
    private func makeClassName() -> String? {
        guard let classType = screen?.classType else { return nil }
        return isSetClassName ? classType : nil
    }
}
