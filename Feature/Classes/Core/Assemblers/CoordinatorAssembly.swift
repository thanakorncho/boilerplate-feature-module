//
//  CoordinatorAssembly.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 8/3/22.
//

import Foundation
import Swinject

final class CoordinatorAssembly: Assembly {
    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            AppFlowAssembly(),
            LoginFlowAssembly(),
            MainFlowAssembly()
        ]
        assemblies.forEach({ $0.assemble(container: container) })
    }

    private func registerNavigationController(_ container: Container) {
        container.register(UINavigationController.self, factory: { _ in
            UINavigationController()
        })
    }
}
