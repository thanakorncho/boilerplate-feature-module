//
//  AppDelegateAssembly.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 19/3/22.
//

import Foundation
import Swinject

class AppDelegateAssembly: Assembly {
    func assemble(container: Container) {
        registerContainerAppDelegate(container)
    }
    
    private func registerContainerAppDelegate(_ container: Container) {
        container.register(
            ContainerAppDelegateDependencies.self,
            factory: { resolver in
                return ContainerAppDelegate(
                    container: resolver.resolve(),
                    window: resolver.resolve())
            })
        .inObjectScope(.container)
        .initCompleted({ _, _ in
            //                appDelegate.container = resolver.resolve()
        })
    }
}
