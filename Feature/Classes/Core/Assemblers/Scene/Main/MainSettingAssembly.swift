//
//  MainSettingAssembly.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 23/4/2566 BE.
//

import Foundation
import Swinject

class MainSettingAssembly: Assembly {

    private typealias ViewModel = MainSettingViewModel

    func assemble(container: Container) {
        useCases(container)
        viewModel(container)
        viewController(container)
    }

    private func useCases(_ container: Container) {
        container.register(
            MainSettingViewModelUseCases.self,
            factory: { _ in
                MainSettingViewModelProvider.UseCases()
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
            MainSettingViewController<ViewModel>.self,
            factory: { _, context in
                MainSettingViewController<ViewModel>(context)
            })
        .inObjectScope(.transient)
    }
}
