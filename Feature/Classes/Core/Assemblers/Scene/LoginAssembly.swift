//
//  LoginAssembly.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//

import Foundation
import Swinject

class LoginAssembly: Assembly {
    private typealias ViewModel = LoginViewModel

    func assemble(container: Container) {
        useCases(container)
        viewModel(container)
        viewController(container)
    }

    private func useCases(_ container: Container) {
        container.register(
            LoginViewModelUseCases.self,
            factory: { _ in
                LoginViewModelProvider.UseCases()
            })
        .inObjectScope(.transient)
    }

    private func viewModel(_ container: Container) {
        container.register(
            LoginViewModel.self,
            factory: { resolver, context in
                LoginViewModel(context, resolver.resolve())
            })
        .inObjectScope(.transient)
    }

    private func viewController(_ container: Container) {
        container.register(
            LoginViewController<ViewModel>.self,
            factory: { _, context in
                LoginViewController<ViewModel>(context)
            })
        .inObjectScope(.transient)
    }
}
