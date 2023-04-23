//
//  ForgotPasswordAssembly.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 23/4/2566 BE.
//

import Foundation
import Swinject

class ForgotPasswordAssembly: Assembly {

    private typealias ViewModel = ForgotPasswordViewModel

    func assemble(container: Container) {
        useCases(container)
        viewModel(container)
        viewController(container)
    }

    private func useCases(_ container: Container) {
        container.register(
            ForgotPasswordViewModelUseCases.self,
            factory: { _ in
                ForgotPasswordViewModelProvider.UseCases()
            })
        .inObjectScope(.transient)
    }

    private func viewModel(_ container: Container) {
        container.register(
            ViewModel.self,
            factory: { resolver, context in
                ViewModel(context, resolver.resolve())
            })
        .inObjectScope(.transient)
    }

    private func viewController(_ container: Container) {
        container.register(
            ForgotPasswordViewController<ViewModel>.self,
            factory: { _, context in
                ForgotPasswordViewController<ViewModel>(context)
            })
        .inObjectScope(.transient)
    }
}
