//
//  UtilityAssembly.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 19/3/22.
//

import Foundation
import Swinject

class UtilityAssembly: Assembly {
    func assemble(container: Container) {
        registerOrientationKit(container)
        registerActivityIndicatorPresenter(container)
    }

    private func registerOrientationKit(_ container: Container) {
        container.register(
            OrientationKitDependencies.self,
            factory: { resolver in
                OrientationKit(resolver.resolve())
            })
            .inObjectScope(.container)
    }

    private func registerActivityIndicatorPresenter(_ container: Container) {
        container.register(
            ActivityIndicatorDependencies.self,
            factory: { _ in
                ActivityIndicatorPresenter()
            })
        .inObjectScope(.container)
    }
}
