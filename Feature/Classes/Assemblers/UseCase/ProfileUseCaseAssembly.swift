//
//  ProfileUseCaseAssembly.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//

import Foundation
import Swinject

final class ProfileUseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(
            ProfileUseCaseDependencies.self,
            factory: { resolver, context in
                ProfileUseCase(context)
            })
        .inObjectScope(.transient)
    }
}
