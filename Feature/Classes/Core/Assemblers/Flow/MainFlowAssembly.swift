//
//  MainFlowAssembly.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 8/3/22.
//

import Foundation
import Swinject

final class MainFlowAssembly: Assembly {
    func assemble(container: Container) {
        register(container)
    }

    private func register(_ container: Container) {
        container.register(
            MainCoordinatorDependencies.self,
            factory: { _, flow, navigationController in
                MainCoordinator(
                    container,
                    flow: flow,
                    navigationController: navigationController)
            })
        .inObjectScope(.weak)
    }
}
