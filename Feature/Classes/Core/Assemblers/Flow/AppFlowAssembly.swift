//
//  AppFlowAssembly.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 8/3/22.
//

import Foundation
import Swinject

class AppFlowAssembly: Assembly {
    func assemble(container: Container) {
        register(container)
    }

    private func register(_ container: Container) {
        container.register(
            AppCoordinatorDependencies.self,
            factory: { _, window in
                return AppCoordinator(container, window)
            })
            .inObjectScope(.container)
    }
}
