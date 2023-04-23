//
//  LoginFlowAssembly.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 9/3/22.
//

import Foundation
import Swinject

final class LoginFlowAssembly: Assembly {
    func assemble(container: Container) {
        register(container)
    }

    private func register(_ container: Container) {
        container.register(
            LoginCoordinatorDependencies.self,
            factory: { _, flow, navigationController in
                LoginCoordinator(
                    container,
                    flow: flow,
                    navigationController: navigationController)
            })
        .inObjectScope(.weak)
    }
}
