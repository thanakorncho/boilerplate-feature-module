//
//  MainProfileAssembly.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 23/4/2566 BE.
//

import Foundation
import Swinject

class MainProfileAssembly: Assembly {

    private typealias ViewModel = MainProfileViewModel

    func assemble(container: Container) {
        useCases(container)
        viewModel(container)
        viewController(container)
    }

    private func useCases(_ container: Container) {
        container.register(
            MainProfileViewModelUseCases.self,
            factory: { _ in
                MainProfileViewModelProvider.UseCases()
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
            MainProfileViewController<ViewModel>.self,
            factory: { _, context in
                MainProfileViewController<ViewModel>(context)
            })
        .inObjectScope(.transient)
    }
}
